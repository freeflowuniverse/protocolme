module people

import freeflowuniverse.protocolme.people
//import freeflowuniverse.protocolme

pub struct Circle {
	//protocolme.Base
pub mut:
	name        string
	description string
	members     []&CircleMember
}

pub enum PersonState {
	active
	inactive
	uncertain
}


pub enum Role {
	stakeholder
	member
	contributor
	follower
}



pub struct CircleMember {
	// Base // TODO this can't be imported into this file as this will create circular imports
pub mut:
	person 			 &people.Person
	state       	 PersonState	
	description      string
	role             Role
	// contribution_fee ContributionFee
	is_admin	bool //can manage all properties of the circle
}


