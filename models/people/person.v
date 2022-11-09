module people

// import freeflowuniverse.protocolme.models.backoffice.finance
import freeflowuniverse.protocolme.models.system

pub enum PersonType {
	employee 
	consultant
	investor
}

[heap]
pub struct Person {
pub mut:
	id              string // needs to be unique
	firstname       string
	lastname        string
	description     string
	start_date      system.OurTime
	end_date        system.OurTime
	contact         &Contact
	person_type     PersonType
}


pub struct PersonNewArgs {
pub mut:
	firstname   string [required] 
	lastname    string [required]
	description string
	person_type string [required]
}

// ## Add Contact Information
//
// ### ARGS:
//
// - firstname string
// - lastname string
// - description string
pub fn (mut person Person) contact_add() !&Contact {
	mut o := Contact{
		firstname: person.firstname
		lastname: person.lastname
		description: person.description //? How to set this as optional if description not given
	}
	person.contact = &o
	// TODO any possible checks
	return person.contact
}
