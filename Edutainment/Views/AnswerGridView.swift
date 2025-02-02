//
//  AnswerGridView.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 2/2/25.
//

import SwiftUI


struct AnswerGridView: View {
    @ObservedObject var vm: EdutainmentViewModel
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFits(
                count: vm.answerArray.count,
                size: geometry.size,
                atAspectRatio: 1
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 10)], spacing: 10) {
                ForEach(vm.answerArray, id: \.self) { item in
                    Button(action: {
                        vm.checkAnswer(item)
                    }) {
                        Text("\(item)")
                            .font(.largeTitle)
                            .padding()
                            .frame(width: gridItemSize, height: gridItemSize)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .fontWeight(.bold)
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
    
    func gridItemWidthThatFits(count: Int, size: CGSize, atAspectRatio aspectRatio: CGFloat) -> CGFloat {
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

#Preview {
    AnswerGridView(vm: EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 20)))
}
