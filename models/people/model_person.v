module people

import freeflowuniverse.backoffice.finance
import time

pub enum PersonType {
	employee 
	consultant
	investor
}

[heap]
pub struct Person {
pub mut:
	id              string // needs to be unique
	firstname       string
	lastname        string
	description     string
	start_date      time.Time
	end_date        time.Time
	contact         &Contact
	paymentmethods 	[]finance.PaymentMethod	
	person_type     PersonType
}


pub struct PersonNewArgs {
pub mut:
	firstname   string [required] 
	lastname    string [required]
	description string
	person_type string [required]
}


pub fn (mut person Person) digital_payment_add (new_method finance.PaymentDigitalNewArgs) !finance.PaymentMethod {
	mut preferred := false
	// If this is the first payment method, set preferred to true
	if person.paymentmethods.len == 0 {
		preferred = true

		// else if preferred true is inputted, sets all other payment methods to false
	} else if new_method.preferred == true {
		preferred = true
		for mut old_method in person.paymentmethods {
			old_method.preferred = false
		}
	}

	blockchain_temp := new_method.blockchain.to_lower()

	blockchain_ := match blockchain_temp {
		'stellar'      {finance.BlockchainType.stellar}     
		'algorand'     {finance.BlockchainType.algorand}    
		'tfchain'      {finance.BlockchainType.tfchain}     
		'ethereum'     {finance.BlockchainType.ethereum}    
		'smartchain'   {finance.BlockchainType.smartchain}  
		else {panic(error("Failed to parse inputted blockchain: Please enter either stellar, algorand, tfchain, ethereum or smartchain."))}
	}

	mut new_method_ := finance.PaymentMethodDigital{
		name: new_method.name
		blockchain: blockchain_
		account: new_method.account
		description: new_method.description
		preferred: preferred
	}

	person.paymentmethods << new_method_
	// TODO any possible checks
	return new_method_
}


// ## Add an Iban Payment Method
// ARGS:
// - finance.PaymentMethodIban
pub fn (mut person Person) iban_payment_add (new_method finance.PaymentIbanNewArgs) !finance.PaymentMethod {
	mut preferred := false
	// If this is the first payment method, set preferred to true
	if person.paymentmethods.len == 0 {
		preferred = true

		// else if preferred true is inputted, sets all other payment methods to false
	} else if new_method.preferred == true {
		preferred = true
		for mut old_method in person.paymentmethods {
			old_method.preferred = false
		}
	}

	mut new_method_ := finance.PaymentMethodIban{
	name: new_method.name
	account_num: new_method.account_num
	iban: new_method.iban
	swift_code: new_method.swift_code
	description: new_method.description
	preferred: preferred
	}

	person.paymentmethods << new_method_
	// TODO any possible checks
	return new_method_
}

// ## Add Contact Information
//
// ### ARGS:
//
// - firstname string
// - lastname string
// - description string
pub fn (mut person Person) contact_add() !&Contact {
	mut o := Contact{
		firstname: person.firstname
		lastname: person.lastname
		description: person.description //? How to set this as optional if description not given
	}
	person.contact = &o
	// TODO any possible checks
	return person.contact
}
