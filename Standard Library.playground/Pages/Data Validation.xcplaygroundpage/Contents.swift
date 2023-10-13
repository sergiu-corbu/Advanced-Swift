//: [Previous](@previous)

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let format = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", format)
        return predicate.evaluate(with: self)
    }
}

enum LoginError: Error {
    case isEmpty
    case invalidEmail
    case missingSpecificSymbol
    case invalidPassword
    //case A missing, a missing -/@#$ missing
}

func registerUser(email: String, password: String) {
    
    var isValidEmail = false
    var isValidPassword = false
    
    do {
        isValidEmail = try validateEmail(with: email)
    } catch LoginError.isEmpty {
        print("Email must not be empty")
    } catch LoginError.missingSpecificSymbol {
        print("")
    } catch LoginError.invalidEmail {
        print("")
    } catch {
        print("Error")
        print(error.localizedDescription)
    }
    
    do {
        isValidPassword = try validatePassword(with: password)
    } catch LoginError.invalidPassword {
        print("invlaid password")
    } catch {
        print("Error")
        print(error.localizedDescription)
    }
    
    guard isValidPassword, isValidEmail else {
        print("Invalid credentials, please try again")
        return
    }
    
    // save data to user defaults (NO Property wrappers) @UserDefault
    // network call
    //...
}


func validateEmail(with email: String) throws -> Bool {
    
    if email.isEmpty {
        throw LoginError.isEmpty
    } else if !email.contains("@") {
        throw LoginError.missingSpecificSymbol
    } else if !email.isValidEmail {
        throw LoginError.invalidEmail
    }
    return true
}

func validatePassword(with password: String) throws -> Bool {
    if password.count < 6 {
        throw LoginError.invalidPassword
    } //else if
    return true
}


//: [Next](@next)
