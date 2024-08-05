//
//  PaycheckView.swift
//  TipTracker
//
//  Created by David Guffre on 6/19/24.
//

import SwiftUI

struct PaycheckView: View {
    @Binding var tipEntries: [TipEntry]
    @State private var startDate: Date = Calendar.current.date(byAdding: .day, value: -15, to: Date())!
    @State private var endDate: Date = Date()

    var body: some View {
        VStack {
            DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                .padding()
            DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                .padding()

            Text("Total for the selected period: \(calculatePaycheck(), specifier: "%.2f")")
                .padding()

            List(filteredEntries, id: \.id) { entry in
                HStack {
                    Text("\(entry.date, formatter: dateFormatter)")
                    Spacer()
                    Text("Tips: \(entry.totalTips, specifier: "%.2f")")
                    Text("Hours: \(entry.hours, specifier: "%.2f")")
                }
            }
        }
        .navigationTitle("Paycheck")
    }

    var filteredEntries: [TipEntry] {
        tipEntries.filter { $0.date >= startDate && $0.date <= endDate }
    }

    func calculatePaycheck() -> Double {
        let totalTips = filteredEntries.reduce(0) { $0 + $1.totalTips }
        let totalHours = filteredEntries.reduce(0) { $0 + $1.hours }

        return totalTips + (totalHours * 16)
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
}

struct PaycheckView_Previews: PreviewProvider {
    @State static var tipEntries: [TipEntry] = []

    static var previews: some View {
        PaycheckView(tipEntries: $tipEntries)
    }
}
