//
//  QuestionView.swift
//  learn-swift
//
//  Created by Ben Morgiewicz on 1/30/24.
//

import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let title : String
    let answer: String
    let options: [String]
    var selection: String?
}


struct QuestionView: View {
    @State var question: Question
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(question.title)
            
            ForEach(question.options, id:\.self) { option in
                HStack {
                    Button {
                        question.selection = option
                        if  question.selection == question.answer && question.selection == option {
                            print("Correct!")
                        }
                    } label: {
                        if  question.selection == question.answer && question.selection == option {
                            Circle()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(uiColor: .green))
                        } else if question.selection == option {
                            Circle()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("AppColor"))
                        } else {
                            Circle()
                                .stroke()
                                .shadow(radius: 3)
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color(uiColor: .systemBlue))
                            
                        }
                    }
                    Text(option)
                }
                // Display answers dot as green after user selects a choice
                .foregroundColor(Color(uiColor: .secondaryLabel))
            }
        }
        .padding(.horizontal, 20)
        .frame(width: 340, height: 550, alignment: .leading)
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(30)
        .shadow(
            color: Color(uiColor: .label).opacity(0.2),
            radius: 15
        )
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuestionView(question: Question(
                title: "When was the Iphone first released?",
                answer: "A",
                options: ["A", "B", "C","D"]
            ))
            .previewDevice("iPhone 12")
            .previewInterfaceOrientation(.portrait)
        }
    }
}
