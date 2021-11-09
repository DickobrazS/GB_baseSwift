//
//  main.swift
//  GB_baseSwift
//
//  Created by Тимофей Соломатин on 02.11.2021.
//

import Foundation

// MARK: - Enums
enum EngineStatus: String {
    case launched = "Заведен"
    case drownedOut = "Заглушен"
}

enum WindowsStatus: String {
    case opened = "открыты"
    case closed = "закрыты"
}

enum LiftingCapacity: String {
    case high = "Высокая"
    case middle = "Средняя"
    case low = "Низкая"
}

enum BodyType: String {
    case wagon = "Фура"
    case minivan = "Минивэн"
    case gazelle = "Газель"
}

enum IsFootboard: String {
    case yes = "Есть"
    case no = "Нет"
}
// MARK: - Car Class
class Car {
    let carModel: String
    let yearOfIssue: Int
    let passengerSeats: Int
    var carEngine: EngineStatus {
        willSet {
            print ("Engine will be \(newValue) in 1 second")
        }
    }
    var carWindows: WindowsStatus {
        willSet {
            print ("Windows will be \(newValue) in 4 seconds")
        }
    }
    var numberOfPassegners: Int = 0 {
        willSet {
            print ("Now \(newValue) passegners are in the car")
        }
        didSet {
            if numberOfPassegners > oldValue {
                print ("\(numberOfPassegners - oldValue) more people got into the car ")
            } else {
                print ("\(oldValue - numberOfPassegners) people got out of the car")
            }
        }
    }

    func defualtPrint () {
        print("Бренд - \(carModel)",
              "\nГод выпуска - \(yearOfIssue)",
              "\nПассажирских мест - \(passengerSeats)",
              "\nСостояние двигателя - \(carEngine.rawValue)",
              "\nОкна \(carWindows.rawValue)",
              "\nКоличество пассажиров в машине - \(numberOfPassegners)"
        )
    }

    init (carModel: String, yearOfIssue: Int, carEngine: EngineStatus, carWindows: WindowsStatus, passengerSeats: Int, numberOfPassegners: Int) {
        self.carModel = carModel
        self.yearOfIssue = yearOfIssue
        self.carEngine = carEngine
        self.carWindows = carWindows
        self.passengerSeats = passengerSeats
        if numberOfPassegners > passengerSeats {
            self.numberOfPassegners = 0
            print ("The number of passengers cannot be more than the number of seats in the car. Number of passengers seats: \(passengerSeats). Try to change the number of passengers ")
        } else {
            self.numberOfPassegners = numberOfPassegners
        }
    }
}
//MARK: - TrunkCar Class
final class TrunkCar: Car {
    let body: BodyType
    let footboard: IsFootboard
    let liftingCapacity: LiftingCapacity
    let trunkVolume: Int
    var filledTrunkVolume: Int {
        didSet {
            if filledTrunkVolume > trunkVolume {
                print ("Filled trunk volume (\(filledTrunkVolume)) cannot be larger than the trunk itself. Trunk volume is: \(trunkVolume). Try to change the value")
                filledTrunkVolume = oldValue
            }
        }
    }

    func fillTheTrunk () {
        print ("We added \(trunkVolume - filledTrunkVolume) liters of cargo. Now, our trunk is full. Let's go!")
        filledTrunkVolume = trunkVolume
    }

    func emptyTrunk () {
        numberOfPassegners = 0
        filledTrunkVolume = 0
        carEngine = .drownedOut
        carWindows = .closed
        print ("Теперь машина пустая и закрытая. Хоть продавай!")
    }

    override func defualtPrint() {
        super.defualtPrint()
        print("Тип кузова - \(body.rawValue)",
              "\nНаличие подножки - \(footboard.rawValue)",
              "\nКатегория грузопопдъемности - \(liftingCapacity.rawValue)",
              "\nОбем багажника - \(trunkVolume) литров",
              "\nЗаполненный объем багажника - \(filledTrunkVolume). Он заполнен на \((Double(filledTrunkVolume)/Double(trunkVolume))*100)%"
        )
    }



    init (carModel: String,
          yearOfIssue: Int,
          carEngine: EngineStatus,
          carWindows: WindowsStatus,
          passengerSeats: Int,
          numberOfPassegners: Int,
          body: BodyType,
          fooboard: IsFootboard,
          liftingCapacity: LiftingCapacity,
          trunkVolume: Int,
          filledTrunkVolume: Int)
    {
        self.body = body
        self.footboard = fooboard
        self.liftingCapacity = liftingCapacity
        self.trunkVolume = trunkVolume
        switch filledTrunkVolume > trunkVolume {
        case true:
            self.filledTrunkVolume = 0
            print ("Filled trunk volume cannot be larger than the trunk itself. Trunk volume is: \(trunkVolume). Try to change the value")
        case false:
            self.filledTrunkVolume = filledTrunkVolume
        }
        super.init(carModel: carModel,
                   yearOfIssue: yearOfIssue,
                   carEngine: carEngine,
                   carWindows: carWindows,
                   passengerSeats: passengerSeats,
                   numberOfPassegners: numberOfPassegners)
    }
}


//MARK: - SportCar Class
final class SportCar: Car {
    let weight: Double
    let brakingDistances: Double
    var maxSpeed: Double {
        didSet {
            print ("Now the max speed is \(maxSpeed) km/h againts \(oldValue)")
        }
    }
    var accelerationSpeed: Double {
        didSet {
            print ("Now the acceleration speed is \(accelerationSpeed) seconds against \(oldValue)")
        }
    }


    func stage1 () {
        maxSpeed *= 1.1
        accelerationSpeed /= 1.2
    }

    func stage2 () {
        maxSpeed *= 1.2
        accelerationSpeed /= 1.4
    }

    func stage3 () {
        maxSpeed *= 1.5
        accelerationSpeed /= 1.6
    }

    override func defualtPrint() {
        super.defualtPrint()
        print("Вес автомобиля - \(weight) кг",
              "\nТормозной путь - \(brakingDistances) м",
              "\nМаксимальная скорость - \(maxSpeed) км/ч",
              "\nРазгон до 100 км/ч занимает - \(accelerationSpeed) секунд"
        )
    }

    init (carModel: String,
          yearOfIssue: Int,
          carEngine: EngineStatus,
          carWindows: WindowsStatus,
          passengerSeats: Int,
          numberOfPassegners: Int,
          maxSpeed: Double,
          accelerationSpeed: Double,
          weight: Double,
          brakingDistances: Double)
    {
        self.maxSpeed = maxSpeed
        self.accelerationSpeed = accelerationSpeed
        self.weight = weight
        self.brakingDistances = brakingDistances
        super.init(carModel: carModel,
                   yearOfIssue: yearOfIssue,
                   carEngine: carEngine,
                   carWindows: carWindows,
                   passengerSeats: passengerSeats,
                   numberOfPassegners: numberOfPassegners)
    }
}

//MARK: - Initialization

var firstTrunkCar = TrunkCar(carModel: "Mersedes", yearOfIssue: 2015, carEngine: .drownedOut, carWindows: .closed, passengerSeats: 2, numberOfPassegners: 1, body: .wagon, fooboard: .yes, liftingCapacity: .high, trunkVolume: 1500, filledTrunkVolume: 750)
var secondTrunkCar2 = TrunkCar(carModel: "BMW", yearOfIssue: 2015, carEngine: .drownedOut, carWindows: .closed, passengerSeats: 2, numberOfPassegners: 1, body: .wagon, fooboard: .yes, liftingCapacity: .high, trunkVolume: 1700, filledTrunkVolume: 500)

secondTrunkCar2.emptyTrunk()
print ("\nВывод свойств первой грузовой машины:")
firstTrunkCar.defualtPrint()
print("\n")



var firstSportCar = SportCar(carModel: "Infinity", yearOfIssue: 2021, carEngine: .launched, carWindows: .closed, passengerSeats: 2, numberOfPassegners: 1, maxSpeed: 210, accelerationSpeed: 3.0, weight: 1400, brakingDistances: 30)

firstSportCar.stage3()
firstSportCar.carEngine = .launched
print ("\nВывод свойств первой спортивной машины:")
firstSportCar.defualtPrint()



