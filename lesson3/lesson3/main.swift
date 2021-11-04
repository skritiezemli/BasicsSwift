//  main.swift
//  lesson3
//
//  Created by Sofia on 30.10.2021.
//

import Foundation

enum CarActions: String {
    case run = "Запустить двигатель"
    case stop = "Остановить двигатель"
    case open = "Открыть окна"
    case close = "Закрыть окна"
    case download = "Загрузить 1 литр в багажник"
    case unload = "Выгрузить 1 литр из багажника"
}

struct NewSportCar {
    let brand: String
    let year: Int
    let trunkValue: Int
    var fullnessTrunk: Int
    var engineStarted: Bool
    var windowsOpened: Bool
    
    init(brand: String, yearOfIssue: Int, trunkVolume: Int){
        self.brand = brand
        self.year = yearOfIssue
        self.trunkValue = trunkVolume
        self.fullnessTrunk = 0
        self.engineStarted = false
        self.windowsOpened = false
    }
    
    mutating func action(carAction: CarActions) {
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
        case .download:
            if self.trunkValue >= self.fullnessTrunk {
                self.fullnessTrunk += 1
            }
        case .unload:
            if self.fullnessTrunk > 0 {
                self.fullnessTrunk -= 1
            }
        }
    }
    
    func info(){
        print("Легковой автомобиль \(self.brand), \(self.year) год, объем багажника \(self.trunkValue)")
        print("Заполненность багажника \(self.fullnessTrunk)")
        print("\(self.engineStarted ? "двигатель запущен" : "двигатель остановлен")")
        print("\(self.windowsOpened ? "Окна открыты" : "Окна закрыты")")
    }
}

struct TrunkCar {
    let brand: String
    let year: Int
    let trunkValue: Int
    var fullnessTrunk: Int
    var engineStarted: Bool
    var windowsOpened: Bool
    
    init(brand: String, yearOfIssue: Int, trunkVolume: Int){
        self.brand = brand
        self.year = yearOfIssue
        self.trunkValue = trunkVolume
        self.fullnessTrunk = 0
        self.engineStarted = false
        self.windowsOpened = false
    }
    
    mutating func action(carAction: CarActions) {
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
        case .download:
            if self.trunkValue >= self.fullnessTrunk {
                self.fullnessTrunk += 1
            }
        case .unload:
            if self.fullnessTrunk > 0 {
                self.fullnessTrunk -= 1
            }
        }
    }
    
    func info(){
        print("Грузовой автомобиль \(self.brand), \(self.year) год, объем багажника \(self.trunkValue)")
        print("Заполненность багажника \(self.fullnessTrunk)")
        print("\(self.engineStarted ? "двигатель запущен" : "двигатель остановлен")")
        print("\(self.windowsOpened ? "Окна открыты" : "Окна закрыты")")
    }
}

var car = NewSportCar(brand: "Audio", yearOfIssue: 1999, trunkVolume: 15)
car.action(carAction: .run)
car.action(carAction: .download)
car.info()
var car2 = NewSportCar(brand: "BMV", yearOfIssue: 2001, trunkVolume: 23)
car2.action(carAction: .open)
car2.action(carAction: .unload)
car2.info()
print("----------")
var truk = TrunkCar(brand: "Kamaz", yearOfIssue: 2020, trunkVolume: 9000)
truk.action(carAction: .download)
truk.action(carAction: .download)
truk.action(carAction: .download)
truk.info()
