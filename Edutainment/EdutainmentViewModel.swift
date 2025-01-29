//
//  EdutainmentViewModel.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 1/28/25.
//

import SwiftUI

class EdutainmentViewModel: ObservableObject {
  //  var easyGame5 = timesTableGame(gameDifficulty: 5, numberOfQuestions: 5)
   /* private static let easyGame10 = timesTableGame(gameDifficulty: 5, numberOfQuestions: 10)
    private static let easyGame15 = timesTableGame(gameDifficulty: 5, numberOfQuestions: 15)
    private static let mediumGame5 = timesTableGame(gameDifficulty: 8, numberOfQuestions: 5)
    private static let mediumGame10 = timesTableGame(gameDifficulty: 8, numberOfQuestions: 10)
    private static let mediumGame15 = timesTableGame(gameDifficulty: 8, numberOfQuestions: 15)
    private static let hardGame5 = timesTableGame(gameDifficulty: 12, numberOfQuestions: 5)
    private static let hardGame10 = timesTableGame(gameDifficulty: 12, numberOfQuestions: 10)
    private static let hardGame15 = timesTableGame(gameDifficulty: 12, numberOfQuestions: 15)
   */
    var currentViewModel: timesTableGame
    var emojiArray: Array<String>{
        return currentViewModel.emojiArray
    }
    @Published var numberOfQuestions: Int
    @Published var userScore: Int
    @Published var question: String
    var answer: Int {
        return currentViewModel.answer
    }
    init(currentViewModel: timesTableGame) {
        self.currentViewModel = currentViewModel
        self.question = currentViewModel.question
        self.numberOfQuestions = currentViewModel.numberOfQuestions
        self.userScore = currentViewModel.userScore
    }
    
    var displayQuestion: String{
        return "\(question) = ?"
    }
    var displayScore: String {
        return "Your Score: \(userScore)"
    }
    var displayQuestionNumber: String {
        return ("Questions Left: \(numberOfQuestions)🤩")
    }
    
    
    func answerCheck(_ userAnswer: Int) {
        currentViewModel.answerCheck(userAnswer)
    }
    // restartGame function when user reaches max questions, an alert calls this function
    func restartGame() {
        // reset user score
        currentViewModel.userScore = 0
        // reset questionNumber
        currentViewModel.numberOfQuestions = currentViewModel.numberOfQuestions
        // Shuffles both randomNumbers (the range changes in other difficulties)
        currentViewModel.randomNumber1 = Int.random(in: 0...currentViewModel.gameDifficulty)
        currentViewModel.randomNumber2 = Int.random(in: 0...currentViewModel.gameDifficulty)
    }
}

