//: Playground - noun: a place where people can play

import UIKit

class Optinal{
	var optionalString:String? = "Hello"
	
	func hello(){
		print(optionalString!)
	}
}

var option = Optinal()
option.hello()
