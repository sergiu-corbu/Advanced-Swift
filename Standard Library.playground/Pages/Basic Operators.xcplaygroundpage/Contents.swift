//: [Previous](@previous)

import Foundation

///Operator types:
///- unary: operate on a single target (pre/post fix). Eg: !isPresented
///- binary: operate on two targets
///- ternary: operate on three targets -> one operator(ternary conditional). `condition` ?  workA : workB

//: [Next](@next)

//MARK: Assignment operator
let b = 10
var a = 5

a = b

let (x, y, z) = (1,2,3)

// Arithmetic operators
// Compound operators
// Comparison operators
// Nil coalescing

// Range operators

// - closed range
for _ in 0...5 {

}

// - half-open range operator
for _ in 0..<4 {

}

// - one sided ranges
for _ in [...10] {

}
for _ in [10...] {
}
for _ in [..<10] {
}

// Logical Operators
