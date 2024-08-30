//
//  ContentView.swift
//  EdutainmentApp(sUI)
//
//  Created by David Guffre on 8/29/24.
//
import SwiftUI

// Challenge:

// Your goal is to build an “edutainment” app for kids to help them practice multiplication tables – “what is 7 x 8?” and so on. Edutainment apps are educational at their core, but ideally have enough playfulness about them to make kids want to play.
//
//	Breaking it down:
//
//	The player needs to select which multiplication tables they want to practice. This could be pressing buttons, or it could be an “Up to…” stepper, going from 2 to 12.
//	The player should be able to select how many questions they want to be asked: 5, 10, or 20.
//	You should randomly generate as many questions as they asked for, within the difficulty range they asked for.
// Start with an App template, then add some state to determine whether the game is active or whether you’re asking for settings.
// Generate a range of questions based on the user’s settings.
// Show the player how many questions they got correct at the end of the game, then offer to let them play again.

// You should generate all your questions as soon as your game starts, storing them as an array of questions.
// Those questions should probably be their own Swift struct, Question, storing the text and the answer.
// When it comes to asking questions, use another state property called questionNumber or similar, which is an integer pointing at some position in your question array.
// You can get user input either using buttons on the screen, like a calculator, or using a number pad text field – whichever you prefer.
// If you intend to pass a closure into a view’s initializer for later use, Xcode will force you to mark it as @escaping. This means “will be used outside of the current method.”


struct ContentView: View {
	@State private var animationAmount: Double = 0.0
	@State var mainColor = Color(red: 30/255, green: 30/255, blue: 30/255)
	
	var body: some View {
		ZStack {
			mainColor.ignoresSafeArea()
			
			VStack {
				Button(action: {
					withAnimation {
						animationAmount += 360
					}
				}) {
					Image(systemName: "macpro.gen1.fill")
						.resizable()
						.frame(width: 50, height: 50)
						.foregroundStyle(.red)
						.rotationEffect(.degrees(animationAmount))
				}
				Text("Hello David")
					.font(.largeTitle)
					.bold()
					.foregroundStyle(.yellow)
			}
			
		}
		
		
		
	}
}

#Preview {
	ContentView()
}
