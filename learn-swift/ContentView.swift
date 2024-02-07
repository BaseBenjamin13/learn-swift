//
//  ContentView.swift
//  learn-swift
//
//  Created by Ben Morgiewicz on 1/28/24.
//

import SwiftUI

//struct Score: Identifiable {
//    let id = UUID()
//    let prev: String
//    let current: String
//}

struct ContentView: View {
    @StateObject var manager = QuizManager()
    
    var body: some View {
        TabView {
            ForEach(manager.mockQuestions.indices, id: \.self) { index in
                VStack {
                    Spacer()
                    QuestionView(question: $manager.mockQuestions[index])
                    Spacer()
                    
                    if let lastQuestion = manager.mockQuestions.last, lastQuestion.id == manager.mockQuestions[index].id {
                        Button {
                            
                            print(manager.gradeQuiz())
                        } label: {
                            Text("Submit")
                                .padding()
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .fill(Color("AppColor"))
                                        .frame(width: 340)
                                )
                        }
                        .buttonStyle(.plain)
                        .disabled(!manager.canSubmitQuiz())
                    }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
