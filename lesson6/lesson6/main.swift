//
//  main.swift
//  lesson6
//
//  Created by Sofia on 13.11.2021.
//

import Foundation

struct Queue<T: Comparable>: CustomStringConvertible {
    var items: [T] = [T]()
    var count: Int {
        get {
            return items.count
        }
    }
    
    var description: String {
        return "count: \(count) elements: \(items)"
    }
    
    mutating func enqueue(_ element: T){
        items.append(element)
    }
    
    mutating func dequeue() -> T? {
        if count > 0 {
            return items.removeFirst()
        } else {
            return nil
        }
    }
    
    mutating func reverse() -> [T] {
        return items.reversed()
    }
    
    func contains(_ item: T) -> Bool {
        return items.contains(item)
    }

//    func filter(item: T){
//        print("find \(items.filter{$0 == item})")
//    }
    
    func filter(item: T) -> [T] {
        return items.filter {(element: T) -> Bool in
            return element == item
        }
    }
}

var animals = Queue<String>()
animals.enqueue("cat")
animals.enqueue("dog")
animals.enqueue("dog")
print(animals.filter(item: "dog"))
print(animals)
var result = animals.dequeue()
print(animals)
result = animals.dequeue()
result = animals.dequeue()
result = animals.dequeue()
print(animals)
