//
//  EasyView5.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 10/13/24.
//
/* Game Screen that asks 5 easy questions, after 5 questions the users score is given and the game is restarted .*/

import SwiftUI
struct EasyView20: View {
    @ObservedObject var vm: EdutainmentViewModel = EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 20))
    // FIXME: Add Alerts and Animations back into the program.
    var body: some View {
        ZStack {
            backgroundGradient()
            VStack  {
                Text("Score: \(vm.userScore)")
                    .ScoreTextStyle()
                
                Text("Questions Left: \(vm.numberOfQuestions)😼")
                    .questionTextStyle()
                Spacer()
                
                Text("\(vm.emojiArray[0])\(vm.question) = ?")
                    .problemTextStyle()
                
                Spacer()
                // FIXME: Add multiple buttons, 3 with wrong answer, one with right one. Make the buttons look like Cards.
                HStack {
                    ForEach(vm.answerArray, id: \.self) { item in
                        Button(action: {
                            vm.checkAnswer(item)
                        }) {
                            Text("\(item)")
                                .font(.largeTitle)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .fontWeight(.bold)
                        }
                    }
                    
                    .foregroundColor(.black)
                    
                }
            }
            .padding()
        }
    }
}


#Preview {
    EasyView20(vm: EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 20)))
}
