
import UIKit

class QuestionBankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, QuestionBuilderDelegate,EditQuestionDelegate {
    
    
    
    var questionBank = (UIApplication.shared.delegate as? AppDelegate)!.questionBank
    var selectedQuestionIndex : Int? = 0
    var selectedQuestion : Question?
    
    
    @IBOutlet weak var questionBankTable: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   questionBankTable.delegate = self
        questionBankTable.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionBank.getAllQuestionsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionCell", for: indexPath)
        
        if let question = questionBank.getQuestion(at: indexPath.row) {
            cell.textLabel?.text = question.question
        }
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedQuestion =  questionBank.questionList[indexPath.row]
        selectedQuestionIndex = indexPath.row
        
        if let editQuestionVC = storyboard?.instantiateViewController(withIdentifier: "EditQuestionViewController") as? EditQuestionViewController {
              editQuestionVC.question = selectedQuestion
              editQuestionVC.index = selectedQuestionIndex
            editQuestionVC.delegate = self
              present(editQuestionVC, animated: true, completion: nil)
          }
        
    }
    
    
    
    func didSaveQuestion(_ question: Question) {
        
        questionBank.addQuestion(question: question)
        questionBankTable.reloadData()
        
    }
    
    func didCancelAddingQuestion() {
        
    }
    
    func didUpdateQuestion(_ question: Question, index:Int) {
        
        questionBank.updateQuestion(at: index, with: question)

        questionBankTable.reloadData()
    }
    
    func didCancelUpdatingQuestion() {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuestionBuilder" {
            if let questionBuilderVC = segue.destination as? QuestionBuilderViewController {
                questionBuilderVC.delegate = self
            }
        }
        
    }
}
