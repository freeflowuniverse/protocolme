module system
import time
import json
import freeflowuniverse.crystallib.texttools
import freeflowuniverse.crystallib.resp
import freeflowuniverse.crystallib.params

[heap]
pub struct Base{
pub mut:
	smartid SmartId
	params params.Params	
	version u8 = 1
}


pub fn (mut o Base) json() string{
	return json.encode(o)
}

pub fn (mut o Base) params_add(text string) !params.Params{
	o.params = params.text_to_params(text)!
	return o.params
}

//returns builder already populated with
// - 99 is the type of serialization, this means its an object
// - objtype
// - version
// - []smartid (the 3 int's for global smartid)
// - bytestr representing the params as resp encoded
// - bytestr representing the acl as resp encoded
pub fn (mut o Base) respbuilder() !resp.Builder{
	mut b := resp.builder_new()
	b.add(resp.r_int(int(99)))
	b.add(resp.r_int(int(o.objtype))) //remember which obj type this is	
	b.add(resp.r_int(int(o.version))) //remember which version this is	
	b.add(resp.r_list_int([
		int(0),//need to implement (region)
		int(0),//need to implement (twin)
		int(smartid_int(o.smartid))]
		)) //smartid
	paramsbytestr := o.params.to_resp()!
	b.add(resp.r_bytestring(paramsbytestr)) // params
	b.add(resp.r_bytestring([]u8{})) //acl
	
	return b
}