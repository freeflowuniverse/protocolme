module system
import time

import math

pub struct SmartId{
mut:
	region string 
	twin string
	obj string
}

pub (mut sid SmartId) set (t string){
	sid.id = t
	//TODO: need to do some checks
}



pub (mut sid SmartId) region_int() u32{
	return smartid_string2int(sid.region)
}

pub (mut sid SmartId) twin_int() u32{
	return smartid_string2int(sid.twin)
}

pub (mut sid SmartId) obj_int() u32{
	return smartid_string2int(sid.obj)
}


pub (mut sid SmartId) str (){
	sid.id = decimalise_smart_id(smart_id)
}



fn smartid_string2int (smart_id string) u32 {
	mut result := 0
	mut count := smart_id.len-1
	for i in smart_id {
		if (i > 47) && (i<58) {
			result += (i-48) * int(math.pow(36,count))
		} else if (i > 96) && (i<123) {
			result += (i-87) * int(math.pow(36,count))
		}
		count -= 1
	}
	return u32(result)
} 

fn smartid_int2string (smart_id u32) string {
	panic("todo")
	return ""
} 