//
//  EasyView5.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 10/13/24.
//
/* Game Screen that asks 5 easy questions, after 5 questions the users score is given and the game is restarted .*/

import SwiftUI
// FIXME: Add animations, put GeometryReader and its function in its own file
struct EasyView20: View {
    @ObservedObject var vm: EdutainmentViewModel = EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 20))
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
                AnswerGridView(vm:vm)
            }
            .padding()
        }
    }
}

#Preview {
    EasyView20(vm: EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 20)))
}
