//: [Previous](@previous)

import Foundation

/// OptionSet - lightweight object to represent a large number of boolean values
/// - it is similar to a `Set`, even though it can be initialized with an Array literal
/// - inherits `SetAlgebra` protocol -> set methods are also available\
/// - it uses a single raw value to represent all of its options

struct NotificationOptions: OptionSet {
    
    let rawValue: Int8
    
    static let daily = NotificationOptions(rawValue: 1) // raw value = 1
    static let weekly = NotificationOptions(rawValue: 1 << 1) // raw value = 2
    static let monthly = NotificationOptions(rawValue: 1 << 2) // raw value = 4
    static let quaterly = NotificationOptions(rawValue: 1 << 3) // raw value = 8
    
    static let all: [NotificationOptions] = [.daily, .weekly, .monthly, .quaterly] // raw value = 15 (sum of all options's raw value)
}

/// Using `bitshift` operator `<<` to the integer 1:

let oneInBits =  0b000001
print(oneInBits == 1)

let twoInBits = oneInBits << 1
print(twoInBits == 2)

/// Int64 -> up to 64 values
/// ...
/// Int8 -> up to 8 values
    
/// When combining all options from an option set, the bitwise operator `OR ( | )` is applied

print( 1 | 2 | 4 | 8) //15
//same as
print(0b00000001 | 0b00000010 | 0b00000100 | 0b00001000 == 0b00001111) //true

/// When checking that an option is contained in an option set, the  bitwise operator `AND ( & )` from an option set, the bitwise operator `OR` is applied
///
/// The important fact  is that OptionSet can store a tremendous amount of information in a single integer with just a couple of bits while also providing a very powerful and flexible API on top of this storage.

struct User {
    var notificationPreferences: NotificationOptions = []
}

var user = User()
user.notificationPreferences = [.daily]

let containsQuaterly = user.notificationPreferences.contains(.quaterly)
user.notificationPreferences.insert(.daily)
print("Is quaterly option selected:", containsQuaterly)

//: [Next](@next)
