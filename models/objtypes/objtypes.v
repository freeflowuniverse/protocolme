module objtypes

import freeflowuniverse.protocolme.models.people

type ObjType = people.Person | people.Contact

pub struct ObjTypes{
pub mut:
	otypes map[u8]ObjType
}


// return a specific object based on objtype and optional data, if data empty then will be empty obj
pub fn get(objtype u8, data string) ?ObjType {

	match objtype {
		1 {
			p:= people.person_new(data)?
			return p
		}else{
			return error("Could not find right objecttype: $objtype")
		}
	}

}

