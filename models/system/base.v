module system
import time

[heap]
pub struct Base{
pub mut:
	smartid string //smartid
	remarks []Remark
	tags []Tags
	
}

//print the wiki formatting for time
fn (ourtime OurTime) md() string{
	return "TODO"
}
