//: [Previous](@previous)

import Foundation

// A type that can be converted to and from an associated raw value

enum Counter: Int {
    case one = 1, two, three
}

//create a counter instance
//using the init?(rawValue: T) initializer
for i in 2...5 {
    print(Counter(rawValue: i))
}

//enums can be of a raw type of Int/String

//but sometimes, we need to convert one enum into another

enum UserType: String {
    case new, existing
}

enum LoginType: String {
    case new, existing
}

extension RawRepresentable {
        
    func convertRaw<T: RawRepresentable>() -> T? where T.RawValue == RawValue {
        return T(rawValue: self.rawValue)
    }
}

//usage

var loginType : LoginType = .new
var userType: UserType? = loginType.convertRaw()



// manual conformance to RawRepresentable
// RawRepresentable can also be implemented on structs

/// ssociatedType `RawValue` - the value type needed for the `rawValue`
/// `init?(rawValue: RawValue)` -  the optional init needed to implement
/// `rawValue: RawValue` - the computed property which holds the value

enum Terrain {
    case forrest, mountain, water
}

extension Terrain: RawRepresentable {
    
    typealias RawValue = String
    
    init?(rawValue: RawValue) {
        switch rawValue {
        case "F": self = .forrest
        case "M": self = .mountain
        case "W": self = .water
        default: return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .mountain: return "M"
        case .forrest: return "F"
        case .water: return "W"
        }
    }
}

let terrainType = Terrain(rawValue: "M")
terrainType?.rawValue

// how to convert UserType into LoginType?
//: [Next](@next)
