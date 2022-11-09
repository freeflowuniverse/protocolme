module system
import time

pub struct OurTime{
	time.Time
}

//print the wiki formatting for time
fn (ourtime OurTime) md() string{
	return "TODO"
}
