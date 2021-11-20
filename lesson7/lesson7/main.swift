//
//  main.swift
//  lesson7
//
//  Created by Sofia on 16.11.2021.
//

import Foundation

// 1. Реализация с guard let

enum AnimalsError: Error {
    case invalidSelection
    case outOfStock
    case insufficintFunds(coinsNeeded: Int)
    case notAvailable
}

struct Item {
    let name: String
    var count: Int
    var price: Int
    let feed: Bool
}


class AnimalsShop {
    var animals = [
        "cat": Item(name: "cat", count: 12, price: 200, feed: false),
        "dog": Item(name: "dog", count: 1, price: 500, feed: false),
        "fish": Item(name: "fish", count: 55, price: 50, feed: true)
    ]
    var coinsDeposited = 1000
    
    func vend(name: String, feed: Bool = false) -> (String?, AnimalsError?) {
        guard let item = animals[name] else{
            return (nil, AnimalsError.invalidSelection)
        }
        guard item.count > 0 else{
            return (nil, AnimalsError.outOfStock)
        }
        guard item.price <= coinsDeposited else {
            return (nil, AnimalsError.insufficintFunds(coinsNeeded: item.price - coinsDeposited))
        }
        if feed {
            guard item.feed else{
                return(nil, AnimalsError.notAvailable)
            }
        }
     
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        animals[name] = newItem
        return (newItem.name, nil)
    }
}

var animal1 = AnimalsShop()
print(animal1.vend(name: "cat",feed: false))

// 2. Реализация с try/catch

struct AnimalsThingsItem{
    let name: String
    var count: Int
    var price: Int
}

class AnimalsThings {
    var things = [
        "leash": AnimalsThingsItem(name: "leash", count: 10, price: 100),
        "ball": AnimalsThingsItem(name: "ball", count: 25, price: 50)
    ]
    var coinsDeposited = 0
    
    func vend(name: String) throws -> String {
        guard let item = things[name] else{
            throw AnimalsError.invalidSelection
        }
        guard item.count > 0 else{
            throw AnimalsError.outOfStock
        }
        guard item.price <= coinsDeposited else{
            throw AnimalsError.insufficintFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        things[name] = newItem
        return newItem.name
    }
}

let animalsThings = AnimalsThings()
do {
    let sell1 = try animalsThings.vend(name: "leash")
    print(sell1)
} catch AnimalsError.invalidSelection {
    print("Такого товара не существует")
} catch AnimalsError.outOfStock {
    print("Такого товара нет в наличии")
} catch AnimalsError.insufficintFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна. Необходимо ещё \(coinsNeeded) монет")
} catch AnimalsError.notAvailable {
    print("Такого товара нет в наличии")
} catch let error {
    print(error.localizedDescription)
}

