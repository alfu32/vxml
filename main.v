module main

import entity
import xml

fn main() {
	ent := entity.new('Hello World!')
	println(ent)
	println(xml.encode[entity.Entity](ent))
	ent2 := entity.new_two('Hello World!',128)
	println(ent2)
	println(xml.encode[entity.EntityTwo](ent2))
}
