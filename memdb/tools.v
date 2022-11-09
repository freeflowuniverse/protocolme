import math

// Decimalise Smart ID
// Converts a smart id string into a u32
// ARGS:
// smart_id - string
pub fn decimalise_smart_id (smart_id string) u32 {
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