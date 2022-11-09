module backoffice

import freeflowuniverse.protocolme.people
import time

//? what is this entire section for?

[heap]
struct Base {
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

/*
Duplicate
fn (mut data Data) remark_add(content string, time string,author string) ?&Remark {
	//TODO: need to implement using time conversion & look for author
	mut contr:=data.person_find(author)?
	time2:=timetools.get(time)?
	data.remarks<<Remark{author:contr,time:time2,content:content}
	return &Remark{}
}
*/
