//: Playground - noun: a place where people can play

import UIKit

var nextYear: Int
var bodyTemp: Float
var hasPet: Bool

var arrayOfInts: [Int]
var dictionaryOfCapotalsByCountry: [String:String]

var winningLotteryNumbers: Set<Int>

var str = "Hello, playground"
str = "Hello, Swift"
let constStr = str

let number = 41
let fmStation = 91.1

//let countingUp = ["one", "two"]
let nameByparkingSpace = [13: "Alice", 27: "Bob"]

var countingUp = ["one", "two"]

countingUp.count

let emptyString = ""
emptyString.isEmpty

let secondElement = countingUp[1]
countingUp.count


countingUp.append("셋셋셋!")

var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
reading3 = 9.7

if let r1 = reading1,
    r2 = reading2,
    r3 = reading3 {
    let avgReading = (r1 + r2 + r3)/3
} else {
    let errorString = "Instrument reported a reading that was nil"
}



