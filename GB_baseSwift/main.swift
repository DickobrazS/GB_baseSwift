//
//  main.swift
//  GB_baseSwift
//
//  Created by Тимофей Соломатин on 02.11.2021.
//

import Foundation

print ("First task:")

let numberForEven: Int = 14

func isNumberEven (_ number: Int) -> Bool {
    return (number % 2 == 0) ? true : false
}

if isNumberEven(numberForEven) {
    print ("The number \(numberForEven) is even")
} else {
    print ("The number \(numberForEven) is not even")
}

//----------------------------------
print ("\nSecond task:")

let numberForDevideToThree: Int = 15

func isNumberDevideToThree (_ number: Int) -> Bool
{
    return number % 3 == 0 ? true : false
}

if isNumberDevideToThree(numberForDevideToThree) {
    print ("The number \(numberForDevideToThree) devides by 3 without remainder")
} else {
    print ("The number \(numberForDevideToThree) devides by 3 with remainder")
}

//----------------------------------
print ("\nThird task:")
var arrayOfNumbers = [Int]()

for  i in (1...100) {
    arrayOfNumbers.append(i)
}
print(arrayOfNumbers)

//----------------------------------
print ("\nFourth task:")

var arrayOfNotEvenNumbers = [Int]()
for i in arrayOfNumbers {
    if !isNumberEven(i) && !isNumberDevideToThree(i) {
        arrayOfNotEvenNumbers.append(i)
    }
}
arrayOfNumbers = arrayOfNotEvenNumbers
print (arrayOfNumbers)

//----------------------------------
print ("\nFifth task:")

var arrayOfFibonaciNumbers = [Int]()
func numberOfFibonaci (_ indexOfNumber: Int) -> Int {
    var fibonaciNumber: Int = 0
    switch indexOfNumber {
        case 1:
            fibonaciNumber = 0
        case 2:
            fibonaciNumber = 1
        default:
            fibonaciNumber = numberOfFibonaci(indexOfNumber - 2) + numberOfFibonaci(indexOfNumber - 1)
    }
    return fibonaciNumber
}

for i in (1...50) {
    arrayOfFibonaciNumbers.append(numberOfFibonaci(i))
}

print (arrayOfFibonaciNumbers)
