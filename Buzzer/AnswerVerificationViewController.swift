//
//  AnswerVerificationViewController.swift
//  Buzzer
//
//  Created by leafranco on 2016-06-01.
//  Copyright © 2016 dfranco. All rights reserved.
//

import UIKit

class AnswerVerificationViewController: UIViewController {

    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answerTextView: UILabel!
    
    var game: Game?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUIElements()

        // Do any additional setup after loading the view.
    }

    func configureUIElements() {
        //   self.navigationItem.setHidesBackButton(true, animated:true);
        
        categoryLabel.text = game?.currentQuestion?.category?.title
        priceLabel.text = game?.currentQuestion?.formattedPrice()
        questionTextView.text = game?.currentQuestion?.question
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func EndGame(sender: AnyObject) {
         performSegueWithIdentifier("FinalResultsSegue", sender: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "FinalResultsSegue" {
            if let destinationViewController = segue.destinationViewController as? FinalResultsViewController {
                destinationViewController.game = game
            }
        }
    }
    

}
