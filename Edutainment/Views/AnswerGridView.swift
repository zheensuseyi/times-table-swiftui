//
//  AnswerGridView.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 2/2/25.
//

import SwiftUI

// FIXME: Clean up code here, use extensions
struct AnswerGridView: View {
    @ObservedObject var vm: EdutainmentViewModel
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = vm.gridItemWidthThatFits(
                count: vm.answerArray.count,
                size: geometry.size,
                aspectRatio: 1
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 10)], spacing: 10) {
                ForEach(vm.answerArray, id: \.self) { item in
                    Button(action: {
                        vm.checkAnswer(item)
                    }) {
                        Text("\(item)")
                            .answerButtonStyle(width: gridItemSize, height: gridItemSize)
                    }
                    .alert("Game Over", isPresented: $vm.gameOver) {
                        Button("New Game") {
                            vm.checkAnswer(item)
                        }
                    } message: {
                        Text("Final Score: \(vm.userScore)")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(height: 300)
    }
}

#Preview {
    AnswerGridView(vm: EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 20)))
}
