//
//  main.swift
//  lesson4
//
//  Created by Sofia on 04.11.2021.
//

import Foundation

enum CarActions: CustomStringConvertible {
    case run, stop, open, close
    var description: String {
        switch self {
        case .run:
            return "Запустить двигатель"
        case .stop:
            return "Остановить двигатель"
        case .open:
            return "Открыть окна"
        case .close:
            return "Закрыть окна"
        }
    }
}

protocol Car{
    var brand: String {get}
    var year: Int {get}
    var engine: Bool {get}
    var windows: Bool {get}
    
    func action(actionName: CarActions) -> Void
}

extension Car {
    func runEngine(){
        action(actionName: .run)
    }
    func stopEngine() {
        action(actionName: .stop)
    }
    func openWindows() {
        action(actionName: .open)
    }
    func closeWindows() {
        action(actionName: .close)
    }
}

class SportCar: Car {
    var brand: String
    var year: Int
    var engine: Bool
    var windows: Bool
    var hatchState: HatchState
    
    enum HatchState{
        case open, close
    }
    
    init(brand: String, year: Int){
        self.brand = brand
        self.year = year
        self.engine = false
        self.windows = false
        self.hatchState = .close
    }
    
    func action(actionName: CarActions) {
        print(actionName)
        switch actionName {
        case .run:
            self.engine = true
        case .stop:
            self.engine = false
        case .open:
            self.windows = true
        case .close:
            self.windows = false
        }
    }
    
    func toggleHatch(){
        if self.hatchState == .close {
            self.hatchState = .open
        } else{
            self.hatchState = .close
        }
    }
}


class TrunkCar: Car {
    var brand: String
    var year: Int
    var engine: Bool
    var windows: Bool
    let trunkValue: Int
    var fullnessTrunk: Int
    var trunkPercent: Double{
        get {
            return Double(fullnessTrunk * 100) /  Double(trunkValue)
        }
    }

    init(brand: String, year: Int, trunkValue: Int){
        self.brand = brand
        self.year = year
        self.engine = false
        self.windows = false
        self.trunkValue = trunkValue
        self.fullnessTrunk = 0
    }
    
    func action(actionName: CarActions) {
        print(actionName)
        switch actionName {
        case .run:
            self.engine = true
        case .stop:
            self.engine = false
        case .open:
            self.windows = true
        case .close:
            self.windows = false
        }
    }
    

    func downloadTrunk(value: Int) {
        if self.fullnessTrunk + value <= self.trunkValue  {
            self.fullnessTrunk += value
        } else {
            print("Багажник заполнен")
        }
    }

    func unloadTrunk(value: Int) {
        if self.fullnessTrunk - value >= 0 {
            self.fullnessTrunk -= value
        } else {
            self.fullnessTrunk = 0
            print("Багажник пуст")
        }
    }
}

extension SportCar: CustomStringConvertible{
    var description: String{
        return "Спротивная машина: \(brand), \(year) год, двигатель запущен: \(engine), окна открыты: \(windows), люк: \(hatchState)"
    }
}

extension TrunkCar: CustomStringConvertible{
    var description: String{
        return "Грузовая машина: \(brand), \(year) год, двигатель запущен: \(engine), окна открыты: \(windows), объем багажника: \(trunkValue), заполненность багажника: \(fullnessTrunk), процент заполненности: \(trunkPercent)"
    }
}

var car1 = SportCar(brand: "audi", year: 2020)
car1.runEngine()
car1.toggleHatch()
print(car1)
print("----------")
var car2 = TrunkCar(brand: "man", year: 2013, trunkValue: 16)
car2.downloadTrunk(value: 4)
print(car2)
