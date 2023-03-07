import UIKit

class A {

    var myVariable = "Hello"

    deinit {

        print("A is deinited")
    }
}

var arr: [A?] = []

func hello() {

    var variable: A? = A()
    weak var variable2 = variable
    arr.append(variable2)

    variable = nil
}

hello()

print(arr[0]?.myVariable)
