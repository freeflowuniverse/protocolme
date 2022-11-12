module people

[heap]
pub struct MemDB {
	DBBase
pub mut:
	people       map[u32]&people.Person [str: skip]
	groups       map[u32]&people.Group [str: skip]
	countries    map[string]&people.Country [str: skip]	
}

// creates a new global data structure
// ARGS:
pub fn new( [2]u32) MemDB {
	mut d := MemDB{}
	d.countries = people.countries_get()
	return d
}
