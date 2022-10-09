//
//  ContentView.swift
//  Challenge - Unit Conversion
//
//  Created by Ajea Smith on 10/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedInput = "meter"
    @State private var selectedOutput = "foot"
    @State private var unit: Double = 1
    let inputUnits = ["meter", "foot"]
    let outputUnits = ["meter", "foot"]
    
    var convertUnits: Double {
        if(selectedInput == "meter" && selectedOutput == "foot"){
            return unit * 3.281
        }else if (selectedInput == "foot" && selectedOutput == "meter"){
            return unit / 3.281
        }
        return 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter unit", value: $unit, format: .number)
                        .keyboardType(.numberPad)
                    Picker("Inputs", selection: $selectedInput) {
                        ForEach(inputUnits, id: \.self) { units in
                            Text(units)
                        }
                    }.pickerStyle(.segmented)
                }header: {
                    Text("Convert From:")
                }
                Section {
                    Picker("Outputs", selection: $selectedOutput) {
                        ForEach(outputUnits, id: \.self) { units in
                            Text(units)
                        }
                    }.pickerStyle(.segmented)
                }header: {
                    Text("Convert To:")
                }
                Section {
                    Text("\(convertUnits)")
                }header: {
                    Text("Results")
                }
            }
            .navigationTitle("Length Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
