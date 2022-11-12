module memdb

import freeflowuniverse.protocolme.models.people
import freeflowuniverse.protocolme.models.system
import freeflowuniverse.protocolme.models.backoffice.organization
import time


[heap]
pub struct MemDBGlobal {
pub mut:
	dbs map[string]MemDB //the key is the region.twin sid
}

[heap]
pub struct MemDB {
	DBBase
pub mut:
	remarks    map[u32]&system.Remarks [str: skip]
	people people.MemDB
}

pub fn new() MemDBGlobal {

}

// creates a new global data structure (is organized per region/twin)
pub fn (mut gdb MemDBGlobal) new(sids [2]u32) MemDB {
	mut d := MemDB{
		people:people.MemDB{}
	}
	gdb.dbs[system.smartids2_string(sids)] = d
	return d
}
