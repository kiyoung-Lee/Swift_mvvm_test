//: Playground - noun: a place where people can play

import UIKit

class Vehicle{
		var currentSpeed = 0.0 // stored property
		var description:String {
			return "travling at \(currentSpeed)"
		}
	
	func makeNoise(){
		print("noiseless")
	}
	
}

let someVehicle = Vehicle()
someVehicle.currentSpeed = 1.0
print("Vehicle : \(someVehicle.description)")

class Bicycle:Vehicle{
	var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 2.0

print(bicycle.description)

class Tandem:Bicycle{
	var currentNumberofPassenger = 0
	override var description:String {
		return "travling at \(currentSpeed), number of passenger : \(currentNumberofPassenger)"
	}
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberofPassenger = 2
tandem.currentSpeed = 30.0

print(tandem.description)

class Train:Vehicle{
	override func makeNoise() {
		print("Train Sound")
	}
}

let train = Train()
train.makeNoise()

class Car:Vehicle{
	var gear = 1
	override var description:String {
		return super.description + " in gear \(gear)"
	}
}

let car = Car()
car.currentSpeed = 352
car.gear = 3
print(car.description)

class AutomaticCar:Car{
	//Stored Property
	override var currentSpeed: Double{
		didSet{
			gear = Int(currentSpeed / 10) + 1
		}
	}
}

let automaticCar = AutomaticCar()
automaticCar.currentSpeed = 30.0
print("AutomaticCar : \(automaticCar.description)")
