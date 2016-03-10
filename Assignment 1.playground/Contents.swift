//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Vehicle{
    
    var model : String?
    var color : String?
    var seats : Int?
    func printmodel()
    {
        print(model!)
        print(model.dynamicType)
    }
    
    func driveFast()
    {
        print("vroom vroom my vehicle is very fast")
    }
    func driveSlow()
    {
        print("wow my vehicle is very slow")
    }
    init? (color :String, seats : Int, model : String){
        self.color = color
        self.seats = seats
        self.model = model
    }
    
}


let c = Vehicle.init(color: "red",seats: 4,model: "toyota")
c!.printmodel()
c!.driveSlow()


enum vehicleType : String{
    case Bike = "Motorcylce/Bike"
    case Car = "Car"
    case Boat = "Boat/Ship"
}


let v : vehicleType = .Car
switch v{
case vehicleType.Boat:
    print("i love boats so much")
case vehicleType.Car:
    print("i love cars so much")
case vehicleType.Bike:
    print("i love bikes so much")
}



enum rentalError : ErrorType{
    case overDue
    case missingDeposit
}


protocol rentalLength{
    var rateperhour : Int {get}
    var lengthinDays: Int{get}
    var lateFee : Int {get}
    func drive()
    mutating func useCar(input: Int)
    func checkRental() throws
    
}
struct RentalCar : rentalLength{
    var rateperhour : Int = 50
    var lengthinDays : Int = 7
    var lateFee : Int = 45
    func drive(){
        print("vroooom")
    }
    mutating func useCar(input: Int){
        lengthinDays -= input
        
    }
    func checkRental() throws{
        if self.lengthinDays <= 0{
            throw rentalError.overDue
        }
        if self.lateFee > 100{
            throw rentalError.missingDeposit
        }
    }
    
    
    
}





var r1 = RentalCar(rateperhour: 40,lengthinDays: 25, lateFee: 200)
r1.drive()
r1.useCar(10)

do {
    try r1.checkRental()
}
catch rentalError.overDue{
    print("overdue car, notify renter")
}
catch rentalError.missingDeposit{
    print("overdue balance, notify renter")
}



class Plane : Vehicle
{
    var maxflyaltitude : Int?
    
    init(color: String, seats: Int, model: String,maxflyaltitude : Int) {
        super.init(color: "red", seats: 4, model: "ford")!
        self.color = color
        self.seats = seats
        self.model = model
        self.maxflyaltitude = maxflyaltitude
    }
    override func driveFast() {
        print("im soaring im flying")
    }
    
}
let p = Plane(color: "Red",seats: 150,model: "Boeing",maxflyaltitude: 20000)
p.driveFast()
let p1 = Plane(color: "Black", seats: 200, model: "Boeing", maxflyaltitude: 25000)
let p2 = Plane(color: "Green", seats: 175, model: "RollsRoyce", maxflyaltitude: 40000)
let p3 = Plane(color: "White", seats: 100, model: "LockheadMartin", maxflyaltitude: 50000)
let p4 = Plane(color: "Grey", seats: 50, model: "StarkIndustries", maxflyaltitude: 100000)

let pArray : [Plane] = [p1,p2,p3,p4]
for k in pArray where k.maxflyaltitude > 25000{
    print(k.model! + "these planes can fly above 25000 feet")
}

var carsInLot = Dictionary<Int,Vehicle>()
carsInLot[1] = c

func removeFromLot(){
    if carsInLot.isEmpty{
        print("no cars in lot, try again")
    }
        
    else{
        carsInLot.removeAll()
    }

}