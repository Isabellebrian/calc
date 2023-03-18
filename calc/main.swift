import Foundation

print("./calc ", terminator: "")
guard let input = readLine()?.replacingOccurrences(of: " ", with: "") else {
    print("Invalid input. Please try again.")
    exit(1)
}

let pattern = "^(\\d+)([+])(\\d+)$"
let regex = try! NSRegularExpression(pattern: pattern)

guard let match = regex.firstMatch(in: input, range: NSRange(input.startIndex..., in: input)) else {
    print("Invalid input. Please enter a valid expression like '4+4'.")
    exit(1)
}

let number1 = Int((input as NSString).substring(with: match.range(at: 1)))!
let operation = (input as NSString).substring(with: match.range(at: 2))
let number2 = Int((input as NSString).substring(with: match.range(at: 3)))!

// Initialize a Calculator object
let calculator = Calculator()

// Calculate the result
var result: Int?

switch operation {
case "+":
    result = calculator.add(no1: number1, no2: number2)
default:
    print("Unsupported operator. Please use + for addition.")
    exit(1)
}

if let result = result {
    print(result)
} else {
    print("Error: Calculation failed.")
    exit(1)
}

