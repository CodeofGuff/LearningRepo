//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by David Guffre on 8/7/24.
//




// ADD A RESET FUNCTION WHEN THE CORRET ANSWRS = 8
// When you tap a flag, make it spin around 360 degrees on the Y axis.
// Make the other two buttons fade out to 25% opacity



import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    var body: some View {
        
        ZStack {
            
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag!")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                Spacer()
                Spacer()
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 20)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                
                Spacer()
                Spacer()
                
                Text("Score \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        
        }
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            // Convert this to switch/case cause it wil be prettier
            if score <= 1 {
                Text("That's \(score)!")
            } else if score <= 2 {
                Text("That's \(score) in a row, keep going!")
            } else if score <= 4 {
                Text("That's \(score) in a row, nice!")
            } else if score <= 5 {
                Text("That's \(score)")
            } else if score <= 7 {
                Text("That's \(score), ONE MORE TO WIN!")
            } else {
                Text("That's \(score) in a row!")
            }
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Incorrect!"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

}


#Preview {
    ContentView()
}
