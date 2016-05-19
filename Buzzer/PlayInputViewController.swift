//
//  PlayInputViewController.swift
//  Buzzer
//
//  Created by leafranco on 2016-05-09.
//  Copyright © 2016 dfranco. All rights reserved.
//

import Foundation
import UIKit

class PlayerInputViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var player1Name: UITextField!
    
    @IBOutlet weak var player2Name: UITextField!
    
    @IBOutlet weak var player3Name: UITextField!
    
    @IBAction func playGameAction(sender: AnyObject) {
        performSegueWithIdentifier("GoToQuestionPicker", sender: nil)
    }
    
  //  func formattedPrice() -> String {
 //       return "$\(price)"
 //   }
    
    class func parseJSON(jsonDictionary: Dictionary<String, AnyObject>) -> Question {
        let question = Question()
        question.question = jsonDictionary["question"] as! String
        question.price = jsonDictionary["value"] as! Int
        question.answer = jsonDictionary["answer"] as! String
        
        return question
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToQuestionPicker" {
            
            if let destinationViewController =  segue.destinationViewController as? QuestionPickerViewController {
                
                let player1 = Player()
                // if nil put the double quotes
                player1.name = player1Name.text ?? ""
                
                let player2 = Player()
                // if nil put the double quotes
                player2.name = player2Name.text ?? ""
                
                let player3 = Player()
                // if nil put the double quotes
                player3.name = player3Name.text ?? ""
                
                let game = Game()
                game.player1 = player1
                game.player2 = player2
                game.player3 = player3
                //game.loadCategoriesForNewGame()
                game.loadCategoriesForNewGame(<#T##numberOfCategories: Int##Int#>, responseActionHandler: { (error) in
                    <#code#>
                })
                
                //
                
                destinationViewController.game = game
            }
        }
        
        
    }
    
    //<#code#>
}

