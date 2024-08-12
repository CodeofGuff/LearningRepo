//
//  ContentView.swift
//  TipTracker
//
//  Created by David Guffre on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var creditCardTips: String = ""
    @State private var cashTips: String = ""
    @State private var hoursWorked: String = ""
    @State private var date: Date = Date()
    @State private var totalEarnings: Double = 0.0
    @State private var tipEntries: [TipEntry] = []
    @FocusState private var amountIsFocused: Bool


    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Enter Your Details")) {
                        TextField("Credit Card Tips", text: $creditCardTips)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                        TextField("Cash Tips", text: $cashTips)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                        TextField("Hours Worked", text: $hoursWorked)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                        DatePicker("Date", selection: $date, displayedComponents: .date)
                    }
                }
                .toolbar {
                    if amountIsFocused {
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
                VStack {
                    Button(action: calculateTotalEarnings) {
                        Text("Calculate")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()

                    Text("Total Earnings: \(totalEarnings, specifier: "%.2f")")
                        .padding()

                    NavigationLink(destination: PaycheckView(tipEntries: $tipEntries)) {
                        Text("View Current Paycheck")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }

                Spacer()
            }
            .navigationTitle("Tip Tracker")
        }
    }

    func calculateTotalEarnings() {
        guard let creditCardTips = Double(creditCardTips),
              let cashTips = Double(cashTips),
              let hoursWorked = Double(hoursWorked) else {
            return
        }

        let totalTips = creditCardTips + cashTips
        totalEarnings = totalTips + (hoursWorked * 16)

        tipEntries.append(TipEntry(date: date, totalTips: totalTips, hours: hoursWorked))
    }
}

struct TipEntry: Identifiable {
    let id = UUID()
    let date: Date
    let totalTips: Double
    let hours: Double
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
