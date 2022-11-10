module system

import math


//global smart if, represents an object on global level
pub struct GSmartId{
pub:
	region u32
	twin u32
	obj u32
	
}

//local smartid
pub struct SmartId{
pub:
	region u32
	twin u32
	obj u32
	//type of the object
	otype u8
}


fn smartid_int (smart_id string) u32 {
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

fn smartid_string (smart_id u32) string {
	mut completed := false
	mut remaining := int(smart_id)
  	mut decimals := []f64{}
  	mut count := 1
	for completed == false {
		if int(math.pow(36,count)) > smart_id {
    		for i in 0..count {
        		decimals << math.floor(f64(remaining / int(math.pow(36,count-1-i))))
        		remaining = remaining % int(math.pow(36,count-1-i))
      		}
      		completed = true
		} else {
			count += 1
		}
	}
  	mut strings := []string{}
    for i in 0..(decimals.len) {
    	if decimals[i] >= 0 && decimals[i] <= 9 {
      		strings << u8(decimals[i]+48).ascii_str()
    	} else {
      		strings << u8(decimals[i]+87).ascii_str()
    	}
    }
	return strings.join('')
} 

//check if formast is [..5].[..5].[..5] . and [..5] is string
//return error if issue
fn smartid_check (smart_id string) ? {
	//TODO: jonathan
}
