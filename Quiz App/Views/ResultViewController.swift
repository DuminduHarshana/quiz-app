import UIKit

class ResultViewController: UIViewController {

    
    var finalScore : Int?
    @IBOutlet weak var ScoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let score = finalScore {
                    
                    ScoreLabel.text = "Your Score: \(score)"
                } else {
                    
                    ScoreLabel.text = "Score not available"
                }
    }
   
}
