//
//  main.swift
//  lesson2
//
//  Created by Sofia on 23.10.2021.
//

import Foundation

// Написать функцию, которая определяет, четное число или нет

func isEven (_ number: Int) -> Bool{
    return number % 2 == 0
}

// Написать функцию, которая определяет, делится ли число
// без остатка на 3

func isDivisibleByThree (_ number: Int) -> Bool{
    return number % 3 == 0
}

// Создать возрастающий массив из 100 чисел

var numbers = Array(1...100)

for (index, item) in numbers.enumerated().reversed() {
    if isEven(item) || !isDivisibleByThree(item) {
        numbers.remove(at: index)
    }
}
print(numbers)

// Функция для чисел Фибоначчи

var fibonacci: [Int] = []

func fibonacciAdd (_ a: inout [Int]) {
    if a.count == 0 {
        a.append(0)
    } else if a.count == 1{
        a.append(1)
    } else{
        a.append(a[a.count - 1] + a[a.count - 2])
    }
}

for _ in 1...50 {
    fibonacciAdd(&fibonacci)
}
print(fibonacci)



