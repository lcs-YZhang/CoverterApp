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
func convertToCelsius (from: TempuretureUnits, value: Int) {
    switch from {
    case .Celsius:
        return value
    case .Fahrenheit:
        return (value - 32) * 5/9
    case .Kelvin:
        return value - 273.15
    }
}
