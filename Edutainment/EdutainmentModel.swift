import Foundation

struct timesTableGame {
    var gameDifficulty: Int
    var numberOfQuestions: Int
    var userScore = 0
    let emojiArray = ["🤔", "🦄", "👽", "🤠"]
    var randomNumber1: Int
    var randomNumber2: Int
    var question: String
    var correctAnswer: Int
    var answerSet: Set<Int>
    var answerArray: [Int]
    var gameOver: Bool = false
    
    init(gameDifficulty: Int, numberOfQuestions: Int) {
        self.gameDifficulty = gameDifficulty
        self.numberOfQuestions = numberOfQuestions
        self.answerSet = timesTableGame.generateAnswerSet(for: gameDifficulty)
        (self.randomNumber1, self.randomNumber2, self.correctAnswer, self.question, self.answerArray) = timesTableGame.generateNewQuestion(gameDifficulty, from: answerSet)
    }
    
    mutating func displayNextQuestion(_ isCorrect: Bool) {
        userScore += isCorrect ? 1 : 0
        if numberOfQuestions > 0 {
            (randomNumber1, randomNumber2, correctAnswer, question, answerArray) = timesTableGame.generateNewQuestion(gameDifficulty, from: answerSet)
            numberOfQuestions -= 1
        }
        else {
            gameOver = true
        }
    }
    
    static func generateNewQuestion(_ gameDifficulty: Int, from answerSet: Set<Int>) -> (Int, Int, Int, String, [Int]) {
        let num1 = Int.random(in: 1...gameDifficulty)
        let num2 = Int.random(in: 1...gameDifficulty)
        let correctAnswer = num1 * num2
        let questionText = "\(num1) * \(num2)"
        
        var answers = [correctAnswer]
        let shuffledAnswers = answerSet.shuffled()
        var index = 0
        
        while answers.count < 4, index < shuffledAnswers.count {
            let potentialAnswer = shuffledAnswers[index]
            if potentialAnswer != correctAnswer {
                answers.append(potentialAnswer)
            }
            index += 1
        }
        return (num1, num2, correctAnswer, questionText, answers.shuffled())
    }
    
    static func generateAnswerSet(for gameDifficulty: Int) -> Set<Int> {
        var set = Set<Int>()
        for i in 1...gameDifficulty {
            for k in 1...gameDifficulty {
                set.insert(i * k)
            }
        }
        return set
    }
}
