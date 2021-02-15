//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Steven Zhang on 2021-02-15.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    @State private var fromUnit: TempueratureUnits = .Celsius
    @State private var input: String = ""
    @State private var toUnit: TempueratureUnits = .Celsius

    // MARK: Computed properties
    private var output: String {
        
        // Ensure the provided input can be expressed as an integer
        guard let providedValue = Int(input) else {
            return "Please provide an integer value."
        }

        // Return the converted value
        return convert(providedValue: Double(providedValue), fromUnit: fromUnit, toUnit: toUnit)

    }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                // UI to allow user to select units we are converting from
                Section(header: Text("Converting from?")) {
                    
                    Picker("From unit:", selection: $fromUnit) {
                        Text(TempueratureUnits.Celsius.rawValue).tag(TempueratureUnits.Celsius)
                        Text(TempueratureUnits.Fahrenheit.rawValue).tag(TempueratureUnits.Fahrenheit)
                        Text(TempueratureUnits.Kelvin.rawValue).tag(TempueratureUnits.Kelvin)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                
                // UI to allow user to provide value to be converted
                Section(header: Text("Value to convert?")) {
                    TextField("e.g.: 1024", text: $input)
                }
                
                // UI to allow user to select units to convert to
                Section(header: Text("Converting to?")) {
                    
                    Picker("To unit:", selection: $toUnit) {
                        Text(TempueratureUnits.Celsius.rawValue).tag(TempueratureUnits.Celsius)
                        Text(TempueratureUnits.Fahrenheit.rawValue).tag(TempueratureUnits.Fahrenheit)
                        Text(TempueratureUnits.Kelvin.rawValue).tag(TempueratureUnits.Kelvin)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }

                // UI to show the result
                Section(header: Text("Result is:")) {
                    
                    Text(output)
                        // Ensures text will wrap to multiple lines
                        .fixedSize(horizontal: false, vertical: true)
                }

            }
            .navigationTitle("Temperature Converter")
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

