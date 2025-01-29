//
//  EdutainmentModel.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 1/28/25.
//

import Foundation
struct timesTableGame {
    var userScore = 0
    var emojiArray = ["🤔", "🦄", "👽", "🤠"]
    
    
    var gameDifficulty: Int
    var numberOfQuestions: Int
    var randomNumber1: Int
    var randomNumber2: Int
    var question: String
    var answer: Int
    init(gameDifficulty: Int, numberOfQuestions: Int) {
        self.gameDifficulty = gameDifficulty
        self.numberOfQuestions = numberOfQuestions
        randomNumber1 = Int.random(in: 0...gameDifficulty)
        randomNumber2 = Int.random(in: 0...gameDifficulty)
        answer = randomNumber1 * randomNumber2
        question = ("\(randomNumber1) * \(randomNumber2)")
    }
    mutating func answerCheck(_ userAnswer: Int) {
        if userAnswer == answer {
            userScore += 1
        }
        numberOfQuestions -= 1
    }
}
