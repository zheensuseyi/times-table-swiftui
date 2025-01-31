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
    @Published var gameOver: Bool
    @Published var placeHolderViewModel: timesTableGame

    init(currentViewModel: timesTableGame) {
        self.currentViewModel = currentViewModel
        self.question = currentViewModel.question
        self.numberOfQuestions = currentViewModel.numberOfQuestions
        self.userScore = currentViewModel.userScore
        self.answer = currentViewModel.answer
        self.answerArray = currentViewModel.answerArray
        self.emojiArray = currentViewModel.emojiArray
        self.gameOver = currentViewModel.gameOver
        self.placeHolderViewModel = currentViewModel
    }
    
    func syncWithViewModel() {
        numberOfQuestions = currentViewModel.numberOfQuestions
        userScore = currentViewModel.userScore
        question = currentViewModel.question
        answer = currentViewModel.answer
        answerArray = currentViewModel.answerArray
        emojiArray = currentViewModel.emojiArray
        gameOver = currentViewModel.gameOver
    }
    
    func createNewGame(_ currentViewModel: timesTableGame) -> timesTableGame {
        return timesTableGame(gameDifficulty: placeHolderViewModel.gameDifficulty, numberOfQuestions: placeHolderViewModel.numberOfQuestions)
    }

    func checkAnswer(_ userAnswer: Int) {
        if currentViewModel.gameOver {
            currentViewModel = createNewGame(currentViewModel)
        } 
        else {
            currentViewModel.displayNextQuestion(userAnswer == currentViewModel.answer)
        }
        syncWithViewModel()
    }
    
}




