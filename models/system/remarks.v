module system
import freeflowuniverse.protocolme.people

[heap]
pub struct Remarks {
pub mut:
	remarks []Remark
}

[heap]
struct Remark {
pub mut:
	content string
	time    time.Time
	author  &people.Person
}
