//
//  AnswerInputViewController.swift
//  Buzzer
//
//  Created by leafranco on 2016-05-30.
//  Copyright © 2016 dfranco. All rights reserved.
//

import UIKit
import CoreData


class AnswerInputViewController: UIViewController {
    
    var game: Game?
    
    @IBOutlet weak var categoryLabel: UILabel!

    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var questionTextView: UITextView!
    
    
    @IBOutlet weak var answerTextView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUIElements()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func configureUIElements() {
        //   self.navigationItem.setHidesBackButton(true, animated:true);
        
        categoryLabel.text = game?.currentQuestion?.category?.title
        priceLabel.text = game?.currentQuestion?.formattedPrice()
        questionTextView.text = game?.currentQuestion?.question
        }
    
    @IBAction func checkAnswer(sender: AnyObject) {
        performSegueWithIdentifier("AnswerVerificationSegue", sender: nil)
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "AnswerVerificationSegue" {
            if let destinationViewController = segue.destinationViewController as? AnswerVerificationViewController {
                destinationViewController.game = game
            }
        }
    }

}
