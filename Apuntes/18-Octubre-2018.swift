//:--------------------------------------------------- Ejemplo 1 -----------------------------------------------------------://

import Cocoa

var str = "Hello Playground"

struct Odometer
{
  var count: Int = 0
}

let odometer = Odometer(count: 10)
print(odometer.count)
//:--------------------------------------------------- Ejemplo 2 -----------------------------------------------------------://
//: Estructuras

struct Temperature 
{
  var celsius: Double
 
  init(celsius: Double) 
  {
    self.celsius = celsius
  }
 
  init(fahrenheit: Double) 
  {
    celsius = (fahrenheit - 32) / 1.8
  }
}
 
let currentTemperature = Temperature(celsius: 18.5)
let boiling = Temperature(fahrenheit: 212.0)
 
print(currentTemperature.celsius)
print(boiling.celsius)

//:--------------------------------------------------- Ejemplo 3 -----------------------------------------------------------://
//: Evitar hacer cambios sin mutacion

struct Odometer 
{
  var count: Int = 0 // Asignando valores por defecto a `count` 
  property.mutating func increment() 
  {
    count += 1
  }
 
  mutating func increment(by amount: Int) 
  {
    count += amount
  }
 
  mutating func reset() 
  {
    count = 0
  }
}
 
var odometer = Odometer() // odometer.count por defecto a 0
odometer.increment() // odometer.count es incrementado a 1
odometer.increment(by: 15) // odometer.count es incrementado a 16 
odometer.reset() // odometer.count es reiniciado a 0


//:--------------------------------------------------- Ejemplo 3 -----------------------------------------------------------://

struct Temperature 
{
  var celsius: Double
  var fahrenheit: Double
  var kelvin: Double
  init(celsius: Double) 
  {
    self.celsius = celsius
    fahrenheit = celsius * 1.8 + 32
    kelvin = celsius + 273.15
  }
 
  init(fahrenheit: Double) 
  {
    self.fahrenheit = fahrenheit
    celsius = (fahrenheit - 32) / 1.8
    kelvin = celsius + 273.15
  }
 
  init(kelvin: Double) 
  {
    self.kelvin = kelvin
    celsius = kelvin - 273.15
    fahrenheit = celsius * 1.8 + 32
  }
}
 
let currentTemperature = Temperature(celsius: 18.5)
let boiling = Temperature(fahrenheit: 212.0)
let freezing = Temperature(kelvin: 273.15)


//:--------------------------------------------------- Ejemplo 4 -----------------------------------------------------------://
//: copia de estructuras
var someSize = Size(width: 250, height: 1000)
var anotherSize = someSize

someSize.width = 500
print(someSize.width)
print(anotherSize.width)


//:--------------------------------------------------- Ejemplo 5 -----------------------------------------------------------://

“class Person {
  let name: String
 
  init(name: String) {
    self.name = name
  }
 x
  func sayHello() {
    print("Hello, there!")
  }
 }
 
let person = Person(name: "Jasmine")
print(person.name)
person.sayHello()

//:--------------------------------------------------- Ejemplo 6 -----------------------------------------------------------://
//: Herencia:
//: - Clase base
class Vehicle 
{
    var currentSpeed = 0.0
 
    var description: String 
    {
        return "traveling at \(currentSpeed) miles per hour"
    }
 
    func makeNoise() 
    {
        // do nothing - an arbitrary vehicle doesn't necessarily 
        make a noise
    }
}
let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

//:--------------------------------------------------- Ejemplo 7 -----------------------------------------------------------://
//: Herencia:
//: - Subclase

class Bicycle: Vehicle {
    var hasBasket = false
}
//: Instacia

let bicycle = Bicycle()
bicycle.hasBasket = true
 
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

//: No existe herencia multiple

//:--------------------------------------------------- Ejemplo 8 -----------------------------------------------------------://
//:
class Tandem: Bicycle 
{
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

//:--------------------------------------------------- Ejemplo 9 -----------------------------------------------------------://
//:
class Train: Vehicle 
{
    override func makeNoise() 
  {
        print("Choo Choo!")
    }
}
 
let train = Train()
train.makeNoise()

//:--------------------------------------------------- Ejemplo 9 -----------------------------------------------------------://
//: Override

class Car: Vehicle 
{
    var gear = 1
    override var description: String 
  {
        return super.description + " in gear \(gear)"
    }
}

//: Super hace referencia a pariente superior

//:--------------------------------------------------- Ejemplo 10 ----------------------------------------------------------://
//: Se requiere un inicializador porque no tiene un default
class Person 
{
  let name: String
 
  init(name: String) 
  {
    self.name = name
  }
}
class Student: Person 
{
  var favoriteSubject: String
 
  init(name: String, favoriteSubject: String) 
  {
    self.favoriteSubject = favoriteSubject
    super.init(name: name)
  }
}

//: Simepre regresa una direccion de memoria con herencias
//: No existen copias

//:--------------------------------------------------- Ejemplo 11 ----------------------------------------------------------://
//: Se requiere un inicializador porque no tiene un default

class Person 
{
  let name: String
  var age: Int
 
  init(name: String, age: Int) 
  {
    self.name = name
    self.age = age
  }
}
 
var jack = Person(name: "Jack", age: 24)
var myFriend = jack
 
jack.age += 1
 
print(jack.age)
print(myFriend.age)

//: Es aconsejable iniciar con estructuras si se quiere hacer referencias, y no copias.
