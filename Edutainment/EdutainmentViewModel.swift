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
    @Published var correctAnswer: Int
    @Published var answerArray: Array<Int>
    @Published var gameOver: Bool
    @Published var placeHolderViewModel: timesTableGame
    var emojiArray: Array<String>

    init(currentViewModel: timesTableGame) {
        self.currentViewModel = currentViewModel
        self.question = currentViewModel.question
        self.numberOfQuestions = currentViewModel.numberOfQuestions
        self.userScore = currentViewModel.userScore
        self.correctAnswer = currentViewModel.correctAnswer
        self.answerArray = currentViewModel.answerArray
        self.emojiArray = currentViewModel.emojiArray
        self.gameOver = currentViewModel.gameOver
        self.placeHolderViewModel = currentViewModel
    }

    func checkAnswer(_ userAnswer: Int) {
        if currentViewModel.gameOver {
            currentViewModel = createNewGame(currentViewModel)
        }
        else {
            currentViewModel.displayNextQuestion(userAnswer == currentViewModel.correctAnswer)
        }
        syncWithViewModel()
    }
    
    func createNewGame(_ currentViewModel: timesTableGame) -> timesTableGame {
        return timesTableGame(gameDifficulty: placeHolderViewModel.gameDifficulty, numberOfQuestions: placeHolderViewModel.numberOfQuestions)
    }

    func syncWithViewModel() {
        numberOfQuestions = currentViewModel.numberOfQuestions
        userScore = currentViewModel.userScore
        question = currentViewModel.question
        correctAnswer = currentViewModel.correctAnswer
        answerArray = currentViewModel.answerArray
        gameOver = currentViewModel.gameOver
    }
    var randomEmoiji: String {
        emojiArray.randomElement() ?? "❓"
    }
}

extension EdutainmentViewModel {
    func gridItemWidthThatFits(count: Int, size: CGSize, aspectRatio: CGFloat) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 2.0
        repeat {
            let width = size.width / columnCount
            let height = width / aspectRatio
            
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * height <= size.height {
                return width.rounded(.down)
            }
            columnCount += 1
        } while columnCount <= count // Ensure columnCount doesn't exceed count
        return (size.width / count)
    }
}




