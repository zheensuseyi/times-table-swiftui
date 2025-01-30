//
//  EdutainmentViewModel.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 1/28/25.
//

import SwiftUI

class EdutainmentViewModel: ObservableObject {
    @Published var currentViewModel: timesTableGame
    @Published var numberOfQuestions: Int
    @Published var userScore: Int
    @Published var question: String
    @Published var answer: Int
    @Published var answerArray: Array<Int>
    @Published var emojiArray: Array<String>
    init(currentViewModel: timesTableGame) {
        self.currentViewModel = currentViewModel
        self.question = currentViewModel.question
        self.numberOfQuestions = currentViewModel.numberOfQuestions
        self.userScore = currentViewModel.userScore
        self.answer = currentViewModel.answer
        self.answerArray = currentViewModel.answerArray
        self.emojiArray = currentViewModel.emojiArray
    }
    
    func checkAnswer(_ userAnswer: Int) {
           // Create a mutable copy of the current game
           var updatedGame = currentViewModel
           
           // Check if the answer is correct
           let isCorrect = userAnswer == updatedGame.answer
           
           // Update the game state
           updatedGame.displayNextQuestion(isCorrect)
           
           // Replace the old game with the updated one
           currentViewModel = updatedGame
           emojiArray = currentViewModel.emojiArray
           question = currentViewModel.question
           numberOfQuestions = currentViewModel.numberOfQuestions
           userScore = currentViewModel.userScore
           answer = currentViewModel.answer
           answerArray = currentViewModel.answerArray
       }
}




