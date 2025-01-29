//
//  EdutainmentViewModel.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 1/28/25.
//

import SwiftUI

class EdutainmentViewModel: ObservableObject {
    var currentViewModel: timesTableGame
    var emojiArray: Array<String>{
        return currentViewModel.emojiArray
    }
    var choicesArray: Array<Int>{
        return currentViewModel.choicesArray.shuffled()
    }
    var answer: Int {
        return currentViewModel.answer
    }
    var displayQuestion: String{
        return "\(question) = ?"
    }
    var displayChoices: String{
        return "Choose your Answer: \(choicesArray[0]), \(choicesArray[1]), \(choicesArray[2]), \(choicesArray[3])"
    }
    var displayScore: String {
        return "Your Score: \(userScore)"
    }
    var displayQuestionNumber: String {
        return ("Questions Left: \(numberOfQuestions)🤩")
    }
    
    @Published var numberOfQuestions: Int
    @Published var userScore: Int
    @Published var question: String
  
    init(currentViewModel: timesTableGame) {
        self.currentViewModel = currentViewModel
        self.question = currentViewModel.question
        self.numberOfQuestions = currentViewModel.numberOfQuestions
        self.userScore = currentViewModel.userScore
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

