//
//  main.swift
//  GB_baseSwift
//
//  Created by Тимофей Соломатин on 02.11.2021.
//

import Foundation

enum EngineStatus {
    case launched
    case drownedOut
}

enum WindowsStatus {
    case opened
    case closed
}

struct LiteCar {
    let carModel: String
    let yearOfIssue: Int
    let trunkVolume: Int
    var carEngine: EngineStatus {
        willSet {
            print ("Engine will be \(newValue) in 1 second")
        }
    }
//  init (carEngine: EngineStatus = .drownedOut) {
//      self.carEngine = carEngine
//  }
// Если вставить эту часть, то он считает, что все остальные параметры не нужны и пишет ошибку в 57 строчке "Cannot infer contextual base in reference to member 'Closed'"
    var carWindows: WindowsStatus {
        willSet {
            print ("Windows will be \(newValue) in 4 seconds")
        }
    }
    var filledTrunkVolume: Int {
        willSet {
            print ("Now \(newValue) liters of luggage compartment is full")
        }
        didSet {
            if filledTrunkVolume > oldValue {
                print ("You put another \(filledTrunkVolume - oldValue) liters in the trunk of your car")
            } else {
                print ("You take \(oldValue - filledTrunkVolume) liters of the baggage from the trunk of your car")
            }
        }
    }
}

struct Truck {
    let carModel: String
    let yearOfIssue: Int
    let trunkVolume: Int
    var carEngine: EngineStatus {willSet {print ("Engine will be \(newValue) in 1 second")}}
    var carWindows: WindowsStatus {willSet {print ("Windows will be \(newValue) in 4 seconds")}}
// Какое из написаний willSet выглядит более понятно и структурированно? То, которое в структуре с легковой машиной или с грузовиком?
    var filledTrunkVolume: Int {
        willSet {print ("Now \(newValue) liters of luggage compartment is full")}
        didSet {
            if filledTrunkVolume > oldValue {
                print ("You put another \(filledTrunkVolume - oldValue) liters in the trunk of your truck")
            } else {
                print ("You take \(oldValue - filledTrunkVolume) liters of the baggage from the trunk of your truck")
            }
        }
    }
}

var firstLiteCar = LiteCar(carModel: "Mazda", yearOfIssue: 2011, trunkVolume: 110, carEngine: .launched, carWindows: .opened, filledTrunkVolume: 70)
let secondLiteCar = LiteCar(carModel: "Opel", yearOfIssue: 2017, trunkVolume: 305, carEngine: .drownedOut, carWindows: .closed, filledTrunkVolume: 50)
let thirdLiteCar = LiteCar(carModel: "BMW", yearOfIssue: 2021, trunkVolume: 150, carEngine: .launched, carWindows: .closed, filledTrunkVolume: 37)

firstLiteCar.carEngine = .drownedOut
firstLiteCar.carWindows = .closed
firstLiteCar.filledTrunkVolume = 60
print("\n")

var firstTruck = Truck(carModel: "Mersedes", yearOfIssue: 2005, trunkVolume: 1500, carEngine: .drownedOut, carWindows: .opened, filledTrunkVolume: 704)
let secondTruck = Truck(carModel: "Daewoo", yearOfIssue: 2001, trunkVolume: 950, carEngine: .drownedOut, carWindows: .closed, filledTrunkVolume: 940)

firstTruck.carEngine = .launched
firstTruck.carWindows = .closed
firstTruck.filledTrunkVolume = 900

print("\n\(firstLiteCar) \n\(secondLiteCar) \n\(thirdLiteCar) \n\(firstTruck) \n\(secondTruck)")
