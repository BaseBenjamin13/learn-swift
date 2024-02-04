//
//  ContentView.swift
//  learn-swift
//
//  Created by Ben Morgiewicz on 1/28/24.
//

import SwiftUI

class QuizManager: ObservableObject {
    @Published var mockQuestions = [
        Question(
            title: "When was the Iphone first released?",
            answer: "A",
            options: ["A", "B", "C","D"]
        ),
        Question(
            title: "When was America established?",
            answer: "1776",
            options: ["1766", "1784", "1776","1821"]
        ),
        Question(
            title: "Whats the best game of all time?",
            answer: "Elden Ring",
            options: ["Black Ops 2", "Elden Ring", "Fortnight","God of War"]
        ),
        Question(
            title: "Who was the first president of the USA?",
            answer: "Gearge Washington",
            options: ["Jackson", "JFK", "Gearge Washington","Abe Lincon"]
        )
    ]
    
    func canSubmitQuiz() -> Bool {
        return mockQuestions.filter({ $0.selection == nil }).isEmpty
    }
    
    func gradeQuiz() -> String {
        var correct: CGFloat = 0
        for question in mockQuestions {
            if question.answer == question.selection {
                correct += 1
            }
        }
        return "\((correct/CGFloat(mockQuestions.count)) * 100)%"
    }
}

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
