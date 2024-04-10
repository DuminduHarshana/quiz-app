import Foundation
class QuestionBank {
    var questionList: [Question] = []

    func getAllQuestionsCount() -> Int {
        return questionList.count
    }

    func addQuestion(question: Question) {
        questionList.append(question)
    }

    func getQuestion(at index: Int) -> Question? {
        if index >= 0 && index < questionList.count {
            return questionList[index]
        }
        return nil
    }

    func updateQuestion(at index: Int, with updatedQuestion: Question) {
        print(updatedQuestion)
        questionList[index] = updatedQuestion
        print(questionList)
        
    }

    func deleteQuestion(at index: Int) {
        if index >= 0 && index < questionList.count {
            questionList.remove(at: index)
        }
    }
}
