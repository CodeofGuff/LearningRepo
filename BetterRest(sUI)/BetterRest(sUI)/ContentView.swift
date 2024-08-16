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
    @State private var wakeUp = Date.now // current cate and time
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
          
            ZStack {
                
                Color(red: 21/255, green: 21/255, blue: 21/255).ignoresSafeArea()
                VStack {
                    Image(systemName: "macpro.gen1.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.red)
                    
                    Text("Hello, David")
                        .foregroundStyle(.yellow)
                        .font(.largeTitle)
                        .bold()
                    

                    
                    VStack {
                        
                        Text("When do you want to wake up?")
                            .font(.headline)
                            .bold()
                        
                        DatePicker("Enter time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .background(.thinMaterial)
                            .clipShape(.rect(cornerRadius: 20))
                        
                        
                        Text("Desired amount of sleep?")
                            .font(.headline)
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                            .background(.thinMaterial)
                            .clipShape(.rect(cornerRadius: 20))
                        
                        Text("Daily coffee intake")
                            .font(.headline)
                        
                        Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
                            .background(.thinMaterial)
                            .clipShape(.rect(cornerRadius: 20))
                        
                    }
                    
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.thinMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    
                    .padding()
                    
                    Button("CALCULATE", action: calculateBedTime)
                        .foregroundColor(.red)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .padding()
                        .padding()
                    

                        
                }
                .navigationTitle("")
                .padding()
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Better Rest")
                            .foregroundColor(.yellow)
                            .font(.largeTitle)
                            .bold()
                        
                    }
                }
                
                        
                .alert(alertTitle, isPresented: $showingAlert) {
                    Button("OK") { }
                } message: {
                    Text(alertMessage)
                }
                }
            }
        }
        func calculateBedTime() {
            do {
                let config = MLModelConfiguration()
                let model = try SleepCalculator(configuration: config)
                
                let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
                let hour = (components.hour ?? 0) * 60 * 60
                let minute = (components.minute ?? 0) * 60
                
                let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
                
                let sleepTime = wakeUp - prediction.actualSleep
                
                alertTitle = "Your ideal bedtime is"
                alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
                
            } catch {
                alertTitle = "Error"
                alertMessage = "Sorry! Problem with our Calculations!!"
            }
            showingAlert = true
        }
   }

#Preview {
    ContentView()
}
