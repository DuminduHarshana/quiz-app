import UIKit

class QuizViewController: UIViewController {
    
    var quizBrain = QuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let questionList = (UIApplication.shared.delegate as? AppDelegate)?.questionBank.questionList, questionList.isEmpty {
            displayAlert(message: "Please create a question bank first.")
            return
        }
        updateUI()
    }
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    
    
    @IBOutlet weak var scoreText: UILabel!
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight == true {
            sender.backgroundColor = UIColor.green
            sender.titleLabel?.textColor = UIColor.white
        } else {
            sender.backgroundColor = UIColor.red
            sender.titleLabel?.textColor = UIColor.white
            
        }
        quizBrain.nextQuestion()
        
        
    
        if quizBrain.allDone {
            // If all questions are done, show the result view
            showResult()
        } else {
            // If not, update the UI for the next question
            
            updateUI()
            resetOptionBackground()
        }       }
    
    
    func updateUI() {
        
        questionLabel.text = quizBrain.getQuestionText()
        
        progressBar.progress = quizBrain.getProgress()
        let answerChoices = quizBrain.getAnswerChoices()
        option1Button.setTitle(answerChoices[0], for: .normal)
        option2Button.setTitle(answerChoices[1], for: .normal)
        option3Button.setTitle(answerChoices[2], for: .normal)
        option4Button.setTitle(answerChoices[3], for: .normal)
        
        //           if quizBrain.allQuestionDone() {
        //               if let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
        //                       // Pass the final score to the result view controller
        //                       resultVC.finalScore = quizBrain.score
        //
        //                       // Present the result view controller
        //                       present(resultVC, animated: true, completion: nil)
        //                   }
        //               }
    }
    private func resetOptionBackground(){
        option1Button.backgroundColor = UIColor.clear
        option2Button.backgroundColor = UIColor.clear
        option3Button.backgroundColor = UIColor.clear
        option4Button.backgroundColor = UIColor.clear
    }
    private func displayAlert(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            // Dismiss the current view controller
            self?.dismiss(animated: true, completion: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    func showResult() {
        if let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
            // Pass the final score to the result view controller
            resultVC.finalScore = quizBrain.score
            
            // Present the result view controller
            present(resultVC, animated: true, completion: nil)
        }
        
        
        
        
    }
}
