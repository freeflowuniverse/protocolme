module system
import time

import math

pub struct SmartId{
pub mut:
	id []u32
}

// Decimalise Smart ID
// Converts a smart id string into a u32 and set in obj
// ARGS:
// smart_id - string
pub (mut sid SmartId) set (smart_id string){
	sid.id = decimalise_smart_id(smart_id)
}

pub (mut sid SmartId) str (smart_id string){
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