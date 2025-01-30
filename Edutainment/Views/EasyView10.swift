//
//  EasyView5.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 10/13/24.
//
/* Game Screen that asks 5 easy questions, after 5 questions the users score is given and the game is restarted .*/

import SwiftUI
struct EasyView10: View {
    @ObservedObject var vm: EdutainmentViewModel = EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 10))
    var body: some View {
        ZStack {
            backgroundGradient()
            VStack  {
                Text("Score: \(vm.userScore)")
                    .ScoreTextStyle()
                
                Text("Questions Left: \(vm.numberOfQuestions)😼")
                    .questionTextStyle()
                Spacer()
                
                Text("\(vm.question) = ?")
                    .problemTextStyle()
                
                Spacer()
                Text("\(vm.answerArray)")
                Button(action: {
                    vm.checkAnswer(6)
                            }) {
                                Text("Tap Me")
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                .foregroundColor(.black)
                
            }
            .padding()
        }
    }
}


#Preview {
    EasyView20(vm: EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 10)))
}
