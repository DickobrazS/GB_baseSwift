//
//  main.swift
//  GB_baseSwift
//
//  Created by Тимофей Соломатин on 02.11.2021.
//

import Foundation
//First Task

print ("First Task:\n")
var a: Double = 4
var b: Double = 3
var c: Double = 15
var x1: Double
var x2: Double
print("Уравнение: \(Int(a))x2 + \(Int(b))x + \(Int(c))")
var D: Double
D = b * b - (4 * a * c)
if (D>0){
    x1 = (-b + sqrt(D))/(2 * a)
    x2 = (-b - sqrt(D))/(2 * a)
    print("Первый корень: \(x1)")
    print("Второй корень: \(x2)")
}else if D == 0 {
    x1 = (-b + sqrt(D))/(2 * a)
    print("Единственный корень: \(x1)")
}else if D<0 {
    print("У уравнения нет корней")
}



//Second task

print ("\nSecond task:\n")
var x, y, sq, pr, z: Double
x = 3
y = 4
sq = (x * y)/2
z = sqrt((x * x) + (y * y))
pr = x + y + z
print("Гипотенуза: \(z)")
print("Периметр: \(pr)")
print("Площадь: \(sq)")

//Third task

print ("\nThird task:\n")
var g,f: Double
g = 100000
f = 5
print ("Сумма вклада: \(g) руб")
print ("Процент вклада: \(f)%")
for _ in 1...5 {
    g = g * (1 + (f/100))
}
print ("Через 5 лет на счету будет: \(g)")
