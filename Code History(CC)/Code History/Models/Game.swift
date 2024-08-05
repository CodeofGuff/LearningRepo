//
//  Game.swift
//  Code History
//
//  Created by David Guffre on 7/18/24.
//

import Foundation

// refers to questions defined in the Questions Struct
// set private so other objects dont have direct access
// private(set) lets it be read, but not written from outside the struct

struct Game {
    private(set) var guesses = [Question: Int]()
    private(set) var currentQuestionIndex = 0
    private(set) var gameOver = false //
    
    private let questions = Question.allQuestions.shuffled() // shuffles the questions around

    // iterates through the guesses dict, and calculates the total number of guesses
    // returns a tuple of correct, incorrect 
    var guessCount: (correct: Int, incorrect: Int) {
        var count: (correct: Int, incorrect: Int) = (0, 0)
        for (question, guessedIndex) in guesses {
            if question.correctAnswerIndex == guessedIndex {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        return count
    }
    // property returns nummber of questions
    var numberOfQuestions: Int {
        questions.count
    }
    // returns current question asked
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    // updates the guessed index for a specific question
    mutating func makeGuessForCurrentQuestion(atIndex index: Int) {
        guesses[currentQuestion] = index
    }
    // proceeds to next question, if no more questions gameOver
    mutating func updateGameStatus() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            gameOver = true
        }
    }
}
