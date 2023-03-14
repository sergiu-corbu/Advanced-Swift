import UIKit

var greeting = "Hello, playground"


import Foundation

// Array
// - ordered container of elements that have the same type
// - provides random acces to each element

var numbers = [1,2]

// mutating

numbers.append(3)
numbers.append(contentsOf: [3,4,5])

// arrays have value semantics -> the contents of it will not change when assigned elsewhere

var x = [1,2,3]
var y = x
y.append(5) // x remains the same

// NSArray and mutability

let a = NSMutableArray(array: [1,2,4])
let b: NSArray = a
a.insert(5, at: 3)
//now b = (1,2,4,5), so the correct way is to manually create a copy upon assignment

let c = NSMutableArray(array: [1,2,4])
let d = c.copy() as! NSArray
c.insert(5, at: 4)
//now d remains the same


// array indexing

//Managing array operations without index

// iterate over
for _ in fibs {
    
}

// iterate over but the first element
for _ in fibs.dropFirst() {
    
}

// iterate over all but the last 2?
for _ in fibs.dropLast(2) {
    
}

// numbering all the elements in an array
for (index, element) in fibs.enumerated() {
    print("Index \(index), with value \(element)")
}

// find a location of a specific element?
if let newIndex = fibs.firstIndex(where: { $0.isMultiple(of: 2)}) {
    print(newIndex)
}

// transform all elements in the array
fibs.map({ $0.signum() > 0 ? $0 * -1 : $0})

// fetch all the elements matching a specific criteria?
fibs.filter({ $0 > 10 })

//first and last element
fibs.first
fibs.last

//MARK: Transforming arrays

// - map: transform every value from a given array

let squares = fibs.map({ fib in fib * fib})
// advantages: 1. Shorter method
//             2. It's clearer

extension Array {
    
    func map<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        var result: [T] = []
        result.reserveCapacity(count)
        for item in self {
            result.append(try transform(item))
        }
        return result
        
    }
    
}

/* in this implementation, the map function will throw any error the transformation functon might throw to the caller. */


//MARK: Most used funtions on arrays

//- filter: include only ceratin elements
let filteredNums = fibs.filter { (num) -> Bool in
    return num % 2 == 0
}

//shorter way ->
let filteredNums2 = fibs.filter({$0 % 2 == 0})

//- allSatisfy: test all elements for a condition
let areAllEven = fibs.allSatisfy({ $0 % 2 == 0})

// - reduce: fold the elements into an aggregate value

//let numbersSum = fibs.reduce($0, { "+" })

// - forEach: visit each element
fibs.forEach { (num) in
    // print (num)
}

//sort
let _ = fibs.sort() // will modify the initial value

//fibs.sort(by: <#T##(Int, Int) throws -> Bool#>)



//hashable

struct Student {
    var firstName: String
    var lastName: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(firstName)
        hasher.combine(lastName)
    }
    
    var hashValue: Int {
        var hasher = Hasher()
        self.hash(into: &hasher)
        return hasher.finalize()
    }

}


//let scores: [Student:Int] = [Student: Int]()

