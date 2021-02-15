//
//  Function.swift
//  CoverterApp
//
//  Created by Steven Zhang on 2021-02-15.
//

import Foundation


/// Convert valur from other units to Celsius
/// - Parameters:
///   - from: What tempreture unit the provided value is in.
///   - value: The value to convert to Celsius.
func convertToCelsius (from: TempueratureUnits, value: Double) -> Double {
    switch from {
    case .Celsius:
        return value
    case .Fahrenheit:
        return (value - 32) * 5/9
    case .Kelvin:
        return value - 273.15
    }
}

func convertFromCelsius (to: TempueratureUnits, value: Double) -> Double {
    switch to {
    case .Celsius:
        return value
    case .Fahrenheit:
        return (value * 9/5) + 32
    case .Kelvin:
        return value + 273.15
    }
}

/// Generates a user-friendly sentence summarizing conversion results, with correct pluralization.
/// - Parameters:
///   - providedValue: The value converted.
///   - finalValue: The converted value.
///   - fromUnit: The unit of the value that was converted.
///   - toUnit: The unit that the value was converted to.
/// - Returns: A sentence summarizing the conversion.
func getTempretureConversionResult(providedValue: Double,
                                    finalValue: Double,
                                    fromUnit: TempueratureUnits,
                                    toUnit: TempueratureUnits) -> String {

    // Start building the result
    var result = ""
    
    // Handle pluralization
    if providedValue == 1 && finalValue == 1 {
        
        result += """
                \(providedValue) \(fromUnit.rawValue) is equal to \(finalValue) \(toUnit.rawValue)
                """
                
    } else if providedValue == 1 {
        
        result += """
                \(providedValue) \(fromUnit.rawValue) is equal to \(finalValue) \(toUnit.rawValue)s
                """

    } else if finalValue == 1 {
        
        result += """
                \(providedValue) \(fromUnit.rawValue)s is equal to \(finalValue) \(toUnit.rawValue)
                """

    } else {
        
        result += """
                \(providedValue) \(fromUnit.rawValue)s is equal to \(finalValue) \(toUnit.rawValue)s
                """
    }
    
    // Report the remainder, if there is one
    if finalValue == 1 {
        result += " with a remainder of \(finalValue) Celsius"
    } else if finalValue > 1 {
        result += " with a remainder of \(finalValue) Celsius"
    }

    // Finish the sentence
    result += "."
    
    // Return complete result
    return result
}

func convert(providedValue: Double, fromUnit: TempueratureUnits, toUnit: TempueratureUnits) -> String {
    
    // Convert the provided value to an equivalent value in bits
    let interimValue = convertToCelsius(from: fromUnit, value: providedValue)
    
    // Convert to the desired destination unit
    let finalValue = convertFromCelsius(to: toUnit, value: interimValue)

    // Get result
    let result = getTempretureConversionResult(providedValue: providedValue,
                                                finalValue: finalValue,
                                                fromUnit: fromUnit,
                                                toUnit: toUnit)

    // Return the result
    return result
    
}
