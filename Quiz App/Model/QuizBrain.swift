import Foundation
import UIKit
var questionBank = (UIApplication.shared.delegate as? AppDelegate)?.questionBank
class QuizBrain{
    
    
    let quizQuestions = questionBank!.questionList
    var questionNumber = 0
    var score = 0
    var allDone = false
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quizQuestions[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        
            return quizQuestions[questionNumber].question
        
    }
    func allQuestionDone() -> Bool {
            return questionNumber > quizQuestions.count-1
        }
    func getAnswerChoices() -> [String] {
        var answerChoices = quizQuestions[questionNumber].incorrectAnswers
        answerChoices.append(quizQuestions[questionNumber].correctAnswer)
        return answerChoices.shuffled() // Shuffling the answer choices
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quizQuestions.count)
    }
    func getScore() -> Int{
        return score
    }
    func nextQuestion() {
        if questionNumber < quizQuestions.count - 1 {
            questionNumber += 1
        } else {
            allDone = true
        }
    }
}
