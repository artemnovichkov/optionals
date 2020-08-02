// Swift Basics
// https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html

// Создание опционала

let longFormAge: Optional<Int> = 27
let age: Int? = 27

var name: String?

// Опционал - это enum

switch age {
case .some(let value):
    print("Мой возраст: \(value)")
case .none:
    print("Возраст не указан")
}

// Работа с опционалами

if age != nil {
    //force unwrapping
    print("Мой возраст: \(age!)")
}

//ошибка выполнения
//name!.count
name = "Артём"
name!.count

// Optional binding

if let userAge = age {
    print("Мой возраст: \(userAge)")
}

// Nil-coalescing оператор

let lastName: String? = nil
print(lastName ?? "Новичков")

// Optional Chaining

func description(forScore score: Int) -> String? {
    if score == 5 { return "Отлично" }
    if score == 4 { return "Хорошо" }
    if score == 3 { return "Удовлетворительно" }
    if score == 2 { return "Неудовлетворительно" }
    if score == 1 { return "Плохо" }
    return nil
}

let firstDescription = description(forScore: 5)
firstDescription?.count
let secondDescription = description(forScore: 6)
secondDescription?.count

// Приведение типов

protocol Animal {
    
    func description()
}

class Fox: Animal {
    
    func description() {
        print("fox")
    }
    
    func run() {
        print("run")
    }
}

class Sparrow: Animal {
    
    func description() {
        print("sparrow")
    }
    
    func fly() {
        print("fly")
    }
}

let animal: Animal = Fox()
if let fox = animal as? Fox {
    fox.run()
}

let sparrow = animal as? Sparrow
sparrow?.description()

// map и flatMap

let discount = Int("10")
let bigDiscount: Int? = discount.map { value in
    value * 2
}
bigDiscount

let maxDiscount: Int? = discount.flatMap { value in
    let newValue = value * 2
    if newValue > 25 {
        return nil
    }
    return newValue
}
maxDiscount
