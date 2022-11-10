module system

// Data Struct
[heap]
pub struct DBBase {
mut:
	//is a map where the smartid of the object is the base and then a list of remarks
	remarks    map[u32]&Remarks [str: skip]
}



// fn (mut base Base) remark_add(content string, unix_time i64, author string) !&Remark {
// 	smartid_check(author)?
// 	mut r := Remark{
// 		author: author
// 		time: time.unix(unix_time)
// 		content: content
// 	}
// 	base.remarks << 
// 	if unix_time == 0 {
// 		time.now().unix_time()
// 	}

// 	return &Remark{}
// }


