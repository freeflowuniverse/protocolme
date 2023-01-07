module pmdb

import freeflowuniverse.protocolme.models.people
import freeflowuniverse.protocolme.models.system
import freeflowuniverse.protocolme.models.backoffice.organization
import time


type RootObj = people.Contact | people.Person | system.Remark

[heap]
pub struct MemDB {
pub mut:
	objs    map[string]&RootObj [str: skip]
}

pub fn new() MemDB {
	return MemDB{}
}

pub fn (mut db MemDB) set(o RootObj) ! {
	match o {
		people.Contact {
			objs[o.sid_get()]=&o
		} people.Person {
			objs[o.sid_get()]=&o
		} system.Remark {
			objs[o.sid_get()]=&o
		}
	}
}

pub fn (mut db MemDB) get(gsid system.SmartId) ! {
	match o {
		people.Contact {
			objs[o.sid_get()]=&o
		} people.Person {
			objs[o.sid_get()]=&o
		} system.Remark {
			objs[o.sid_get()]=&o
		}
	}
}