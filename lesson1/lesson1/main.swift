//
//  main.swift
//  lesson1
//
//  Created by Sofia on 19.10.2021.
//

import Foundation

// Решить квадратное уравнение
let a: Double = 1
let b: Double = -2
let c: Double = -3

let d: Double = b * b - 4 * a * c

if d < 0 {
    print("Корней нет")
} else if d == 0 {
    print("Найден один корень: x = \(-b / 2 * a)")
} else {
    let x1: Double = (sqrt(d) - b) / (2 * a)
    let x2: Double = (-sqrt(d) - b) / (2 * a)
    print("Найдены корни уравнения: x1 = \(x1) x2 = \(x2)")
}

// Найти площадь, периметр и гипотенузу треугольника если известны катеты

let catetA: Double = 5
let catetB: Double = 12
let S: Double = catetA * catetB / 2
let hypotenuse: Double = sqrt(catetA * catetA + catetB * catetB)
let P: Double = hypotenuse + catetA + catetB
 print("Площадь: \(S) Периметр: \(P) Гипотенуза: \(hypotenuse)")

// Найти сумму вклада через 5 лет

let yearCount = 5

print("Введите сумму вклада")
var summ: Double = Double(readLine()!) ?? 0

print("Введите годовой процент")
let percent: Double = Double(readLine()!) ?? 0

for _ in 1...yearCount {
    summ = summ + summ * percent * 0.01
}
print("Сумма вклада через \(yearCount) лет: \(summ)")
