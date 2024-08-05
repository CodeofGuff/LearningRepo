//
//  ContentView.swift
//  Code History
//
//  Created by David Guffre on 7/4/24.
//

import SwiftUI

struct ContentView: View {
    let question = Question(
        questionText: "What was the first computer bug?",
        possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"], //0, 1, 2, 3
        correctAnswerIndex: 2
    )
    
    
    @State var mainColor = Color(red: 20/255, green: 28/255, blue: 58/255)
    
    
    
    var body: some View {
        ZStack {
            mainColor.ignoresSafeArea()
            VStack {
                Text("1 / 10")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding()
                Text(question.questionText)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                
                Spacer()
                HStack {
                  ForEach(0..<question.possibleAnswers.count) { answerIndex in
                    Button(action: {
                      print("Tapped on option with the text: \(question.possibleAnswers[answerIndex])")
                        mainColor = answerIndex == question.correctAnswerIndex ? .green : .red
                        }) {
                      ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                    }
                  }
                }
            }
            .foregroundColor(.white)
        }
    }
}











#Preview {
    ContentView()
}
