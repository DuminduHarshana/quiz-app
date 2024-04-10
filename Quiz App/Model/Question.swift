import Foundation

class Question {
    var question: String
    var correctAnswer: String
    var incorrectAnswers: [String]

    init(question: String, correctAnswer: String, incorrectAnswers: [String]) {
        self.question = question
        self.correctAnswer = correctAnswer
        self.incorrectAnswers = incorrectAnswers
    }
}

