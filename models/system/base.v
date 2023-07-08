module system
import json
import freeflowuniverse.crystallib.params
import freeflowuniverse.crystallib.encoder


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
	o.params = params.new(text)!
	return o.params
}

//returns bin encoder already populated with
// - version
// - []smartid (the 3 int's for global smartid)
// - bytestr representing the params as bin encoded
pub fn (mut o Base) bin_encoder() !encoder.Encoder{
	mut b := encoder.encoder_new()
	b.add_int(o.version) //remember which version this is	

	paramsbytestr := o.params.to_resp()! //TODO: need to use encoder
	b.add_bytes(paramsbytestr) // params

	panic("not implemented")
	
	return b
}