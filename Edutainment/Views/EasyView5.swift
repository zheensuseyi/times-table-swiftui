//
//  EasyView5.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 10/13/24.
//
/* Game Screen that asks 5 easy questions, after 5 questions the users score is given and the game is restarted .*/

import SwiftUI
struct EasyView5: View {
    @ObservedObject var vm: EdutainmentViewModel = EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 5))
    @State private var input: String = ""
    @State private var number: Int?
    var body: some View {
        ZStack {
            backgroundGradient()
            VStack  {
                // Shows the user their score
                Text(vm.displayScore)
                // Custom text extension
                    .ScoreTextStyle()
                // Shows the number of questions that updates
                Text(vm.displayQuestionNumber)
                // Custom text extension
                    .questionTextStyle()
                Spacer()
                // Shows the user the problem that must be solved, random emoji is assigned with every new problem
                Text(vm.displayQuestion)
                    .problemTextStyle()
                    
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    EasyView5(vm: EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 5)))
}
