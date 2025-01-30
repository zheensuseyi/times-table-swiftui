//
//  EdutainmentModel.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 1/28/25.
//

import Foundation
struct timesTableGame {
    var gameDifficulty: Int
    var numberOfQuestions: Int
    var userScore = 0
    var emojiArray = ["🤔", "🦄", "👽", "🤠"]
    var randomNumber1: Int
    var randomNumber2: Int
    var question: String
    var answer: Int
    var answerSet = Set<Int>()
    var answerArray: Array<Int>
    init(gameDifficulty: Int, numberOfQuestions: Int) {
        self.gameDifficulty = gameDifficulty
        self.numberOfQuestions = numberOfQuestions
        randomNumber1 = Int.random(in: 1...gameDifficulty)
        randomNumber2 = Int.random(in: 1...gameDifficulty)
        answer = randomNumber1 * randomNumber2
        question = ("\(randomNumber1) * \(randomNumber2)")
        
        
        for i in 1...gameDifficulty {
            for k in 1...gameDifficulty {
                answerSet.insert(i * k)
            }
        }
        answerArray = [answer]
        let tempArr = answerSet.shuffled()
        var i = 0
        var k = 0
        while k <= 2 && i < answerSet.count {
            if !answerArray.contains(tempArr[i]) {
                answerArray.append(tempArr[i])
                k += 1
            }
            i += 1
        }
        answerArray = answerArray.shuffled()
    }
    mutating func displayNextQuestion(_ isCorrect: Bool) {
        // Update userScore if the answer is correct
        print("hi")
        if numberOfQuestions != 0 {
            if isCorrect {
                userScore += 1
            }
            // Generate new random numbers and update the question and answer
            emojiArray = emojiArray.shuffled()
            randomNumber1 = Int.random(in: 1...gameDifficulty)
            randomNumber2 = Int.random(in: 1...gameDifficulty)
            answer = randomNumber1 * randomNumber2
            question = "\(randomNumber1) * \(randomNumber2)"
            
            // Shuffle the answerArray for the new question
            answerArray = [answer]
            let tempArr = answerSet.shuffled()
            var i = 0
            var k = 0
            while k <= 2 && i < answerSet.count {
                if !answerArray.contains(tempArr[i]) {
                    answerArray.append(tempArr[i])
                    k += 1
                }
                i += 1
            }
            answerArray = answerArray.shuffled()
            numberOfQuestions -= 1
        }
        // FIXME: Perhaps make a new function that restarts the game instead of just printing to console
        else {
            question = ("GAME OVER")
        }
    }
}
