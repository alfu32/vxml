module entity

import rand
import time

pub struct Entity{
	id string
	name string
	created time.Time
	modified time.Time
}


pub struct EntityTwo{
id string
name string
signal int
}

pub fn new(name string) Entity {
	return Entity{
		id: rand.uuid_v4(),
		name: name,
		created: time.now(),
		modified: time.now(), 
	}
}


pub fn new_two(name string,signal int) EntityTwo {

return EntityTwo{
id: rand.uuid_v4(),
name: name,
signal:signal, 
}
}