//: [Previous](@previous)

import Foundation

let students = ["Andrew", "Lucy", "Thomas"]
let members = ["Amy", "Bob", "Thomas"]

//Breaking a for loop
studentLoop: for name1 in students {
    for name2 in members {
        if name1 == name2 {
            print("Found first same in 2 arrays: \(name1)")
            break studentLoop
        }
    }
}

//: [Next](@next)

