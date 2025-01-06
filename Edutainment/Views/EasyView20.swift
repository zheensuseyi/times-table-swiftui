//
//  EasyView20.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 10/13/24.
//
/* Game Screen that asks 20 easy questions, only change from EasyView5 is number of questions */

import SwiftUI
struct EasyView20: View {
    @State private var questionNumber = 1
    @State private var randomNumber1 = Int.random(in: 0...5)
    @State private var randomNumber2 = Int.random(in: 0...5)
    @State private var randomEmoji = Int.random(in: 0...3)
    @State private var selection: Int = 0
    @State private var scoreTitle = ""
    @State private var showAlert = false
    @State private var showingScore = false
    @State private var gameOver = false
    @State private var userScore = 0
    @State private var emojiArray = ["🤔", "🦄", "👽", "🤠"].shuffled()
    @State private var animationAmount = 0.0
    
    let maxQuestions = 20

    
    var answer: Int {
        return randomNumber1 * randomNumber2
    }
    
    var products: [Int] {
        var productsSet = Set<Int>()
        
        for a in 0...5 {
            for b in 0...5 {
                productsSet.insert(a * b)
            }
        }
        return productsSet.sorted()  
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
                    Text("Your Score Was \(userScore) ")
                }
            
            VStack  {
                Text("Your Score: \(userScore)")
                    .ScoreTextStyle()
                Spacer()
                Text("Question \(questionNumber) / \(maxQuestions) 🤩")
                    .questionTextStyle()
                Spacer()
                .padding(0)
                Text("\(emojiArray[randomEmoji])\(randomNumber1) x \(randomNumber2) = ?")
                    .problemTextStyle()
                Spacer()
                .padding()
                Picker("Select a Number", selection: $selection) {
                    ForEach(products, id: \.self) { number in
                        Text("\(number)").tag(number)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                Spacer()
                .padding()
                Button(action: { numberSelected(selection) }) {
                    Text("Tap Here To Enter Answer 🚨")
                        .buttonTextStyle()
                }
                .rotationEffect(.degrees(animationAmount))
                .animation(.easeInOut(duration: 1.0), value: animationAmount)
            }
        }
    }
    
    func numberSelected(_ number: Int) {
        if questionNumber != 20 {
            if(number == answer) {
                scoreTitle = "Correct"
                userScore += 1
                questionNumber += 1
            }
            else {
                scoreTitle = "Incorrect! The correct answer was \(answer)"
                questionNumber += 1
            }
            showingScore = true
        }
        else if questionNumber == 20  {
            if(number == answer) {
                scoreTitle = "Correct"
                userScore += 1
                gameOver = true
            }
            else {
                scoreTitle = "Incorrect! The correct answer was \(answer)"
                gameOver = true
            }
        }
        else {
            gameOver = true
        }
        withAnimation {
            animationAmount += 360
        }
    }
    
    func askQuestion() {
        emojiArray.shuffle()
        randomNumber1 = Int.random(in: 0...5)
        randomNumber2 = Int.random(in: 0...5)
        selection = products.randomElement() ?? 0
    }
    
    func restartGame() {
        userScore = 0
        questionNumber = 1
        randomNumber1 = Int.random(in: 0...5)
        randomNumber2 = Int.random(in: 0...5)
        selection = products.randomElement() ?? 0
    }
}

#Preview {
    EasyView20()
}
