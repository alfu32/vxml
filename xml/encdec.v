module xml
import v.reflection
import walkingdevel.vxml { parse }

fn get_string(data string, field_name string) string {
	for line in data.split_into_lines() {
		key_val := line.split('=')
		if key_val[0] == field_name {
			return key_val[1]
		}
	}
	return ''
}

fn get_int(data string, field string) int {
	return get_string(data, field).int()
}

pub fn decode[T](data string) []T {
	mut docxml:=parse(data)
	classname:=(T.name)
	nodes:=docxml.get_elements_by_tag_name(classname)
	mut result := []T{}
	// compile-time `for` loop
	// T.fields gives an array of a field metadata type
	for node in nodes {
		mut inst := $(T.name){}
		$for field in T.fields {

			name:=node.get_element_by_tag_name('${field.name}') or { panic(err) }
			inst.$(field.name)=name.get_text()
		}
		result<<inst
	}
	return result
}

pub fn encode[T](data T) string {
	mut lines := []string{}
	classname:=(T.name)
	lines<<"<$classname>"
	$for field in T.fields {
		// $if field.typ is string {
			// $(string_expr) produces an identifier
			flfn:="${field.name}"
			flvl:=data.$(field.name)
			fltn:=reflection.type_name(field.typ)
			lines<<'  <$flfn type="$fltn">$flvl</$flfn>'
	}
	lines<<"</$classname>"
	return lines.join("\n")
}
