module main
import walkingdevel.vxml { parse_file }
import entity
import xml


fn generate_entities(){
	for _ in 1..11 {
		ent := entity.new('Hello World!')
		// println(ent)
		println(xml.encode[entity.Entity](ent))
	}
	for _ in 1..11 {
		ent2 := entity.new_two('Hello World!',128)
		// println(ent2)
		println(xml.encode[entity.EntityTwo](ent2))
	}

}
fn main() {
	ent0 := parse_file('./resources/test.00.xml') or { panic(err) }
	println(ent0)
	println(ent0.children)
	println(ent0.children[0])
	println(ent0.children[0].children)
	ent00 := ent0.get_elements_by_tag_name('entity.Entity')
	println(ent00)
	id:=ent00[0].get_element_by_tag_name('id') or { panic(err) }
	println(id)
	name:=ent00[0].get_element_by_tag_name('name') or { panic(err) }
	println(name)
	created:=ent00[0].get_element_by_tag_name('created') or { panic(err) }
	println(created)
	modified:=ent00[0].get_element_by_tag_name('modified') or { panic(err) }
	println(modified)
	// // println(id)
}
