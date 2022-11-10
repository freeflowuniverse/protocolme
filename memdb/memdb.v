module memdb

import freeflowuniverse.protocolme.models.people
import freeflowuniverse.protocolme.models.backoffice.organization
import time

// Data Struct
[heap]
pub struct MemDB {
	DBBase
pub mut:
	people       map[u32]&people.Person [str: skip]
	companies    map[u32]&organization.Company
	groups       map[u32]&people.Group [str: skip]
	// TODO: expenses []&organization.ExpenseItem
	countries    map[string]&people.Country [str: skip]
	
}

// creates a new global data structure
// ARGS:
pub fn new( [2]u32) MemDB {
	mut d := MemDB{}
	d.countries = people.countries_get()
	return d
}
