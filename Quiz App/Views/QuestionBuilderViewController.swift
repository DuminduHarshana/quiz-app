import UIKit

protocol QuestionBuilderDelegate: AnyObject {
    func didSaveQuestion(_ question: Question)
    func didCancelAddingQuestion()
}

class QuestionBuilderViewController: UIViewController {
    weak var delegate: QuestionBuilderDelegate?
   
       
       override func viewDidLoad() {
           super.viewDidLoad()
       }
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var correctAnswerTextField: UITextField!
    @IBOutlet weak var firstIncorrectAnswerTextField: UITextField!
    @IBOutlet weak var secondIncorrectAnswerTextField: UITextField!
    @IBOutlet weak var thirdIncorrectAnswerTextField: UITextField!
    @IBAction func SaveQuestionToList(_ sender: UIButton) {
            guard let questionText = questionTextField.text,
                  let correctAnswer = correctAnswerTextField.text,
                  let firstIncorrectAnswer = firstIncorrectAnswerTextField.text,
                  let secondIncorrectAnswer = secondIncorrectAnswerTextField.text,
                  let thirdIncorrectAnswer = thirdIncorrectAnswerTextField.text else {
                
                displayAlert(message: "All fields are required.")
                return
            }

            
        if questionText.isEmpty{
            displayAlert(message: "Question is required")
            return
        }
        if correctAnswer.isEmpty {
            displayAlert(message: "Correct Answer is required")
            return
        }
        if firstIncorrectAnswer.isEmpty   {
                displayAlert(message: "Please enter atleast one incorrect answer .")
                return
            }

            let newQuestion = Question(question: questionText, correctAnswer: correctAnswer, incorrectAnswers: [firstIncorrectAnswer, secondIncorrectAnswer, thirdIncorrectAnswer])

            
            delegate?.didSaveQuestion(newQuestion)

            
            dismiss(animated: true, completion: nil)
        }

        private func displayAlert(message: String) {
            let alertController = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    @IBAction func CancelButton(_ sender: UIButton) {
        
        delegate?.didCancelAddingQuestion()
              
              
              dismiss(animated: true, completion: nil)
    }
    


   

}
