//
//  ContentView.swift
//  WordScramble(sUI)
//
//  Created by David Guffre on 8/21/24.
//

import SwiftUI


//Put a text view somewhere so you can track and show the player’s score for a given root word. How you calculate score is down to you, but something involving number of words and their letter count would be reasonable.
// Overhaul UI and GameStaten(manual reset of game only via alert)

struct ContentView: View {
	
	@State private var usedWords = [String]()
	@State private var rootWord = ""
	@State private var newWord = ""
	
	@State private var errorTitle = ""
	@State private var errorMessage = ""
	@State private var showingError = false
	
	
	var body: some View {

		NavigationStack {
			List {
				Section {
					TextField("Enter your word", text: $newWord)
						.textInputAutocapitalization(.never)
				}
				
				Section {
					ForEach(usedWords, id: \.self) { word in
						HStack {
							Image(systemName: "\(word.count).circle")
							Text(word)
						}
					}
				}
			}
			.navigationTitle(rootWord)
			.onSubmit(addNewWord)
			.onAppear(perform: startGame)
			.alert(errorTitle, isPresented: $showingError) {
				Button("OK") { }
			} message: {
				Text(errorMessage)
			}
		}
		VStack {
			Button {
				startGame()
			} label: {
				Text("New game")
			}
		}
	}
	
	func addNewWord() {
		// lower case and trims the word, doesnt allow words with extra spaces
		let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
		
		guard answer.count > 0 else { return }
		
		guard isOriginal(word: answer) else {
			wordError(title: "Word used already!", message: "Be more original!")
			return
		}
		
		guard isPossible(word: answer) else {
			wordError(title: "Word not possible!", message: "You can't spell that word from '\(rootWord)'!")
			return
		}
		
		guard isReal(word: answer) else {
			wordError(title: "Word not recognized", message: "You can't just make them up!")
			return
		}
		
		withAnimation {
			usedWords.insert(answer, at: 0)
		}
		
		newWord = ""
	}
	
	func startGame() {
		if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
			if let startWords = try? String(contentsOf: startWordsURL) {
				let allWords = startWords.components(separatedBy: "\n")
				rootWord = allWords.randomElement() ?? "silkworm"
				return
			}
		}
		fatalError("Could not load start.txt from bundle.")
	}
	
	// used words contains the word we used, if it contains it it is not original
	func isOriginal(word: String) -> Bool {
		!usedWords.contains(word)
	}
	
	// check if words are made out of letters of another words
	func isPossible(word: String) -> Bool {
		var tempWord = rootWord
		
		for letter in word {
			if let pos = tempWord.firstIndex(of: letter) {
				tempWord.remove(at: pos)
			} else {
				return false
			}
		}
		return true
	}
	
	//UIKit text checker
	func isReal(word: String) -> Bool {
		let checker = UITextChecker()
		let range = NSRange(location: 0, length: word.utf16.count)
		let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
		return misspelledRange.location == NSNotFound
	}

	
	func wordError(title: String, message: String) {
		errorTitle = title
		errorMessage = message
		showingError = true
	}
}

#Preview {
	ContentView()
}
