//
//  EasyQuestionSelect.swift
//  Edutainment
//
//  Created by Zheen Suseyi on 10/13/24.
//

// Easy # of Questions Select Screen

import SwiftUI
struct EasyQuestionSelect: View {
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundGradient()
                VStack {
                    // Title
                    Text("SELECT # OF QUESTIONS 🤯")
                        .QSelectTextStyle()
                    Spacer()
                    
                    // On tap takes user to easy game screen with 5 questions
                    NavigationLink(destination: EasyView5(vm: EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 5)))) {
                        Image("5pic")
                            .customImageStyle()
                        }
                    
                    Spacer()
                    // On tap takes user to easy game screen with 10 questions
                    NavigationLink(destination: EasyView10(vm: EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 10)))) {
                        Image("10pic")
                            .customImageStyle()

                     }
                    Spacer()
                    // On tap takes user to easy game screen with 20 questions
                    NavigationLink(destination: EasyView20(vm: EdutainmentViewModel(currentViewModel: timesTableGame(gameDifficulty: 5, numberOfQuestions: 20)))) {
                        Image("20pic")
                            .customImageStyle()
                    }
                }
            }
        }
    }
}

#Preview {
    EasyQuestionSelect()
}
