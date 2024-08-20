//
//  ContentView.swift
//  BetterRest(sUI)
//
//  Created by David Guffre on 8/16/24.
//

import CoreML
import SwiftUI


struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 30
        return Calendar.current.date(from: components) ?? .now
        
    }
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Color(red: 21/255, green: 21/255, blue: 21/255).ignoresSafeArea()
                VStack {
                    Image(systemName: "bed.double.fill")
                        .resizable()
                        .frame(width: 100, height: 75)
                        .foregroundStyle(.red)
                    
                    Text("Hello, David")
                        .foregroundStyle(.yellow)
                        .font(.largeTitle)
                        .bold()
                    
                    
                    
                    VStack {
                        VStack {
                            Text("When do you want to wake up?")
                                .font(.headline)
                                .bold()
                            DatePicker("Enter time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            
                        }
                        .background(.thinMaterial)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(10)
                        
                        VStack {
                            Text("Desired amount of sleep?")
                                .font(.headline)
                            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                            
                        }
                        .background(.thinMaterial)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(10)
                        
                        VStack {
                            
                            Text("Coffee/Caffiene intake")
                                .font(.headline)
                            // using this syntax you  an make it 1 cup, then 2 cups with a plural    ^[](inflect: true)
                            Stepper("^[\(coffeeAmount) drink](inflect: true)", value: $coffeeAmount, in: 1...10)
                            
                        }
                        .background(.thinMaterial)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(10)
                    }
                    .background(.thinMaterial)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(35)
                    VStack {
                        Text("Your bedtime is")
                            .foregroundStyle(.yellow)
                            .font(.title)
                            .bold()
                        Text("\(calculateBedTime())")
                            .foregroundStyle(.red)
                            .font(.title)
                            .bold()
                        Text("get some sleep bitch")
                        
                    }
                    
                }
                
                .navigationTitle("")
                .padding()
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Better Rest")
                            .foregroundColor(.yellow)
                            .font(.largeTitle)
                            .bold()
                            .padding(.top, 75)
                    }
                    
                }
            }
        }
    }
    func calculateBedTime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            
            return "Error"
        }
        
    }
}

#Preview {
    ContentView()
}
