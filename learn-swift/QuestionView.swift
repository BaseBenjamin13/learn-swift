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
    let choices: [String]
}

struct QuestionView: View {
    @State var question: Question

    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(question.title)

            
            ForEach(question.choices, id:\.self) { choice in
                Text(choice)
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
                choices: ["A", "B", "C","D"]
            ))
                .previewDevice("iPhone 13 Pro")
        }
    }
}
