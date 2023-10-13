//: [Previous](@previous)

import Foundation

@resultBuilder
enum ConcatenatedResultBuilder {
    
    static func buildBlock(_ components: String...) -> String {
        return components.joined(separator: " ").replacingOccurrences(of: "a", with: "A")
    }

}

struct Foo {
    
    @ConcatenatedResultBuilder
    func printValues() -> String {
        "some acrlyic test"
        "in ma apricot"
    }
}

let f = Foo()
print(f.printValues())

//: [Next](@next)
