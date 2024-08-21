//
//  ContView.swift
//  TipTracker
//
//  Created by David Guffre on 8/12/24.
//

import SwiftUI

struct ContView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool


    // This is ugly.. How fix? 
    let tipPercentages = [0, 15, 20, 25, 30]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var tipSplit: Double {
        let tipSelection = Double(tipPercentage)
        let peopleCount = Double(numberOfPeople + 2)
        let tip = checkAmount / 100 * tipSelection
        let total = tip / peopleCount
        return total
    }

    var tip: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        return tipValue
    }
    
    var total: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("bill total:") {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<50) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much would you like to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                }
                .pickerStyle(.menu)
                
                Section("Tip per person"){
                    Text(tipSplit, format: .currency(code:  Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Amount Per Person (Including tip):") {
                    Text(totalPerPerson, format: .currency(code:  Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Bill total, including tip") {
                    Text(total, format: .currency(code:  Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeTip")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        
        
    }
        .backgroun
        ignoresSafeArea()
        
}











#Preview {
    ContView()
}
