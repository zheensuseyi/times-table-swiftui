import SwiftUI

struct EasyView10: View {
    @State private var questionNumber = 1
    @State private var randomNumber1 = Int.random(in: 0...5)
    @State private var randomNumber2 = Int.random(in: 0...5)
    @State private var randomEmoji = Int.random(in: 0...3)
    @State private var userInput: String = "" // New input field
    @State private var scoreTitle = ""
    @State private var showAlert = false
    @State private var showingScore = false
    @State private var gameOver = false
    @State private var userScore = 0
    @State private var emojiArray = ["🤔", "🦄", "👽", "🤠"].shuffled()
    @State private var animationAmount = 0.0

    let maxQuestions = 10

    var answer: Int {
        randomNumber1 * randomNumber2
    }
    
    var body: some View {
        ZStack {
            backgroundGradient()
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Continue", action: askQuestion)
                } message: {
                    Text("Ready for the next question?")
                }
                .alert(scoreTitle, isPresented: $gameOver) {
                    Button("Game Over! Restart?", action: restartGame)
                } message: {
                    Text("Your Score Was \(userScore)")
                }
            VStack {
                
                Text("Your Score: \(userScore)")
                    .ScoreTextStyle()
                Text("Question \(questionNumber) / \(maxQuestions) 🤩")
                    .questionTextStyle()
                Spacer()
                Text("\(emojiArray[randomEmoji])\(randomNumber1) x \(randomNumber2) = ?")
                    .problemTextStyle()
                .padding()
                Spacer()
                TextField("Type Answer Here!", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle()) // Applies rounded border style
                    .multilineTextAlignment(.center)  // Center the text
                    .keyboardType(.numberPad)
                    .padding()
                Spacer()
                Button(action: submitAnswer) {
                    Text("Submit Answer 🚨")
                        .buttonTextStyle()
                }
                .rotationEffect(.degrees(animationAmount))
                .animation(.easeInOut(duration: 1.0), value: animationAmount)
            }
        }
    }
    
    
    func submitAnswer() {
        guard let userAnswer = Int(userInput) else {
            scoreTitle = "Invalid Input"
            showingScore = true
            return
        }
        
        if questionNumber != 10 {
            if userAnswer == answer {
                scoreTitle = "Correct"
                userScore += 1
            } else {
                scoreTitle = "Incorrect! The correct answer was \(answer)"
            }
            questionNumber += 1
            showingScore = true
        } else {
            if userAnswer == answer {
                scoreTitle = "Correct"
                userScore += 1
            } else {
                scoreTitle = "Incorrect! The correct answer was \(answer)"
            }
            gameOver = true
        }
        withAnimation {
            animationAmount += 360
        }
        userInput = "" // Reset input
    }
    
    func askQuestion() {
        emojiArray.shuffle()
        randomNumber1 = Int.random(in: 0...5)
        randomNumber2 = Int.random(in: 0...5)
        userInput = ""
    }

    func restartGame() {
        userScore = 0
        questionNumber = 1
        askQuestion()
    }
}

#Preview {
    EasyView10()
}
