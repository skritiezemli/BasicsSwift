//
//  main.swift
//  lesson4
//
//  Created by Sofia on 04.11.2021.
//

import Foundation

class Car {
    let brand: String
    let year: Int
    var engineStarted: Bool
    var windowsOpened: Bool
    var color: Color;
    
    enum Color {
        case red, blue, purple, yellow
    }
    
    enum CarActions: String {
        case run = "Запустить двигатель"
        case stop = "Остановить двигатель"
        case open = "Открыть окна"
        case close = "Закрыть окна"
    }
    
    init(brand: String, year: Int, color: Color){
        self.brand = brand
        self.year = year
        self.engineStarted = false
        self.windowsOpened = false
        self.color = color
    }
    
    func action(carAction: CarActions) {
        print(carAction.rawValue)
        switch carAction {
        case .run:
            self.engineStarted = true
        case .stop:
            self.engineStarted = false
        case .open:
            self.windowsOpened = true
        case .close:
            self.windowsOpened = false
        }
    }
    
    func info() {
        print("\(self.brand), \(self.year) год, цвет \(self.color)")
        print("двигатель запущен: \(self.engineStarted)")
        print("окна открыты: \(self.windowsOpened)")
    }
}

class SportCar: Car {
    var hatchState: HatchState
    
    enum HatchState{
        case open, close
    }
    
    override init(brand: String, year: Int, color: Car.Color) {
        self.hatchState = .close
        super.init(brand: brand, year: year, color: color)
    }
    
    func toggleHatch(){
        if self.hatchState == .close {
            self.hatchState = .open
        } else{
            self.hatchState = .close
        }
    }
    override func info() {
        print("Спортивная машина")
        super.info()
        print("Люк \(self.hatchState)")
    }
}

class TrunkCar: Car {
    let trunkValue: Int
    var fullnessTrunk: Int
    var trunkPercent: Double{
        get {
            return Double(fullnessTrunk * 100) /  Double(trunkValue)
        }
    }
    
    init(brand: String, year: Int, color: Car.Color, trunkValue: Int) {
        self.trunkValue = trunkValue
        self.fullnessTrunk = 0
        super.init(brand: brand, year: year, color: color)
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
    
    override func info() {
        print("Грузовой автомобиль")
        super.info()
        print("Объем багажника: \(self.trunkValue)")
        print("Загруженно в багажник: \(self.fullnessTrunk)")
        print("Процент загруженности багажника: \(self.trunkPercent)")
    }
}

var car1 = TrunkCar(brand: "volvo", year: 2001, color: .blue, trunkValue: 15)

car1.downloadTrunk(value: 3)
car1.info()
print("----------")
var car2 = Car(brand: "audi", year: 2012, color: .red)
car2.action(carAction: .run)
car2.action(carAction: .open)
car2.info()
print("----------")
var car3 = SportCar(brand: "subaru", year: 2020, color: .purple)
car3.toggleHatch()
car3.action(carAction: .open)
car3.info()
