module backoffice

import freeflowuniverse.protocolme.people
import freeflowuniverse.protocolme.organization
import freeflowuniverse.protocolme.models.backoffice.people
import freeflowuniverse.protocolme.models.system
import time

// Data Struct
[heap]
pub struct Data {
	system.Remarks
pub mut:
	people       map[string]&people.Person
	countries    map[string]&people.Country [str: skip]
	companies    map[string]&organization.Company
	circles      map[string]&organization.Group
	// TODO: expenses []&organization.ExpenseItem
}

// creates a new global data structure
// ARGS:
pub fn new() Data {
	mut d := Data{}
	// TODO: d.people = people.people_get()
	d.countries = countries_get()
	// TODO: generate budget function
	// TODO: d.expenses = organization.expenses_get()
	return d
}

//? What is a remark?
// remark_add
// ARGS:
// author = full name of author
fn (mut memdb MemDB) remark_add(content string, unix_time i64, author string) !&Remark {
	// TODO: need to implement using time conversion & look for author
	mut person := data.person_get(author)!
	data.remarks << Remark{
		author: person
		time: time.unix(unix_time)
		content: content
	}
	return &Remark{}
}


