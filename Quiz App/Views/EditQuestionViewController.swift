import UIKit
protocol EditQuestionDelegate : AnyObject{
    func didUpdateQuestion(_ question: Question,index:Int)
    func didCancelUpdatingQuestion()
}
class EditQuestionViewController: UIViewController {

    var question: Question?
    var index : Int?
    weak var delegate: EditQuestionDelegate?
    
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var correctAnswerTextField: UITextField!
    @IBOutlet weak var firstIncorrectAnswerTextField: UITextField!
    @IBOutlet weak var secondIncorrectAnswerTextField: UITextField!
    @IBOutlet weak var thirdIncorrectAnswerTextField: UITextField!
        override func viewDidLoad() {
            super.viewDidLoad()
            // Setup UI elements with existing question data
            if let question = question {
                questionTextField.text = question.question
                correctAnswerTextField.text = question.correctAnswer
                firstIncorrectAnswerTextField.text = question.incorrectAnswers[0]
                secondIncorrectAnswerTextField.text = question.incorrectAnswers[1]
                thirdIncorrectAnswerTextField.text = question.incorrectAnswers[2]
            }
        }
     
        
        @IBAction func SaveChanges(_ sender: UIButton) {
            // Validate input fields
            guard let questionText = questionTextField.text,
                  let correctAnswer = correctAnswerTextField.text,
                  let firstIncorrectAnswer = firstIncorrectAnswerTextField.text,
                  let secondIncorrectAnswer = secondIncorrectAnswerTextField.text,
                  let thirdIncorrectAnswer = thirdIncorrectAnswerTextField.text else {
                displayAlert(message: "All fields are required.")
                return
            }
            
            if questionText.isEmpty || correctAnswer.isEmpty || firstIncorrectAnswer.isEmpty {
                displayAlert(message: "Please fill all the required fields.")
                return
            }
            
            // Create the updated question
            let updatedQuestion = Question(question: questionText, correctAnswer: correctAnswer, incorrectAnswers: [firstIncorrectAnswer, secondIncorrectAnswer, thirdIncorrectAnswer])
            
            // Notify the delegate with the updated question
            
            delegate?.didUpdateQuestion(updatedQuestion,index: index!)
            
            // Dismiss the view controller
            dismiss(animated: true, completion: nil)
        }
        
        @IBAction func CancelButton(_ sender: UIButton) {
            delegate?.didCancelUpdatingQuestion()
            dismiss(animated: true, completion: nil)
        }
        
        private func displayAlert(message: String) {
            let alertController = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    

  

}
