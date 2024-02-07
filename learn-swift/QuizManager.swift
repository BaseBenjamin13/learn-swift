//
//  QuizManager.swift
//  learn-swift
//
//  Created by Ben Morgiewicz on 2/6/24.
//

import Foundation
import SwiftUI
//import Supabase

class QuizManager: ObservableObject {
    
    @State private var text = ""
    @AppStorage("SCORE") var score: Double = 0
    @AppStorage("PREV_SCORE") var prevScore: Double = 0
    
//    @Published var questions = [Question]()
    
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
    
//    let client = SupabaseClient(
//        supabaseURL: URL(string: "https://rlsxxymxpwbtmbsrikgx.supabase.co")!,
//        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsc3h4eW14cHdidG1ic3Jpa2d4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDcwMTY5OTQsImV4cCI6MjAyMjU5Mjk5NH0.p_yd0c5CFxTBjjDnxcHkI-GUB1XVB62xVw2Nlqg5UTU"
//    )
//    
//    struct Q: Decodable {
//        let id: Int
//        let createdAt: String
//        let title: String
//        let answer: String
//        let options: [String]
//    }
//    init() {
//        Task {
//            do {
////                let res: [QuizManager.Q] = try await client.database.from("quiz").select().execute().value
////               
//                let res: [Q] = try await client.database
//                    .from("quiz")
//                    .select()
//                    .execute()
//                    .value
//               
//                print(res)
////                print(string(data: data, encoding: .utf8))
//            } catch {
//                print("error when fetching questions")
//            }
//        }
//    }
    
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
    
        if score == 0 && prevScore == 0{
            score = (correct/Double(mockQuestions.count) * 100)
        } else {
            prevScore = score
            score = (correct/Double(mockQuestions.count) * 100)
        }
        print(prevScore)
        print(score)
        mockQuestions = [
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

        return "\((correct/CGFloat(mockQuestions.count)) * 100)%"
    }
}

