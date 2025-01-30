//
//  EasyView5.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 10/13/24.
//
/* Game Screen that asks 5 easy questions, after 5 questions the users score is given and the game is restarted .*/

import SwiftUI
// FIXME: Add animations and alerts
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
           
                // FIXME: understand GeometryReader, place it in its own file,
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
                                    .frame(width: gridItemSize, height: gridItemSize) // Make buttons square
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure the grid fills the available space
                }
                .frame(height: 300) // Constrain the height of the GeometryReader
            }
            .padding()
        }
    }
    // FIXME: understand what this function does
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
    EasyView20(vm: EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 20)))
}
