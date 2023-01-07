module people

//group of people (persons)
pub struct Group {
pub mut:
	name        string
	description string
	members     []&GroupMember
}

pub enum PersonState {
	active
	inactive
	uncertain
}


pub enum Role {
	follower
	stakeholder
	member
	contributor	
}



pub struct GroupMember {
pub mut:
	person 			 &Person
	description      string
	role             Role
	// contribution_fee ContributionFee
	is_admin		bool //can manage all properties of the Group
	active       	 PersonState
}


