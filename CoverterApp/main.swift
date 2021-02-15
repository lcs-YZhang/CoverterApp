//
//  main.swift
//  CoverterApp
//
//  Created by Steven Zhang on 2021-02-15.
//

import Foundation

print("Hello, World!")

func printTempretureUnitOptions() {
    print("""
        1 - Celsius
        2 - Fahrenheit
        3 - Kelvin
        """)
}

/// Converts the data storage selection from a string to an enumeration case
func convertToEnumerationCase(selection: String) -> TempueratureUnits {
    switch selection {
    case "1":
        return .Celsius
    case "2":
        return .Fahrenheit
    case "3":
        return .Kelvin
    default:
        return .Celsius
    }
}

while true {
    
    // MARK: Input
    
    // Show initial menu
    print("""
        Tempreture Converter
        ======================

        Converting from?

        """)
    printTempretureUnitOptions()
    
    // What data storage unit are we converting from?
    let providedFromUnit = String.collectInput(withPrompt: "Please make a selection (1/2/3): ",
                                               acceptableValues: ["1", "2", "3", ])
    
    // Get the value to be converted
    let providedValue = Int.collectInput(withPrompt: "\nEnter the value to be converted: ", minimum: 0, maximum: nil)
    
    // What system are we converting to?
    print("""

        Converting to?

        """)
    printTempretureUnitOptions()
    
    // What data storage unit are we converting to?
    let providedToUnit = String.collectInput(withPrompt: "Please make a selection (1/2/3): ",
                                             acceptableValues: ["1", "2", "3"])

    // MARK: Process

    // Translate the provided "from" unit from the input menu into an enumeration case
    let fromUnit = convertToEnumerationCase(selection: providedFromUnit)
    
    // Translate the provided "to" unit from the input menu into an enumeration case
    let toUnit = convertToEnumerationCase(selection: providedToUnit)
    
    // Get the result
    let result = convert(providedValue: Double(providedValue), fromUnit: fromUnit, toUnit: toUnit)

    // MARK: Output

    // Report results
    print("")
    print(result)

    // Pause before continuing
    print("\nPress return to continue.")
    
    // This captures the return key
    _ = readLine()
}
