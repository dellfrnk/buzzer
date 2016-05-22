//
//  PlayInputViewController.swift
//  Buzzer
//
//  Created by leafranco on 2016-05-09.
//  Copyright © 2016 dfranco. All rights reserved.
//

import Foundation
import UIKit

class PlayerInputViewController : UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.player1Name.delegate = self
        self.player2Name.delegate = self
        self.player3Name.delegate = self
    }
    
    let unsafeChars = NSCharacterSet.alphanumericCharacterSet().invertedSet
    let letters = NSCharacterSet.alphanumericCharacterSet()
    
    @IBOutlet weak var player1Name: UITextField!
    
    @IBOutlet weak var player2Name: UITextField!
    
    @IBOutlet weak var player3Name: UITextField!
    
    @IBAction func playGameAction(sender: AnyObject) {
        performSegueWithIdentifier("GoToQuestionPicker", sender: nil)
    }
    
  //  func formattedPrice() -> String {
 //       return "$\(price)"
 //   }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    //    print(textField1.text)
        print("While entering the characters this method gets called")
        
        //let validTimeCharacterSet = NSCharacterSet(charactersInString: "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
        
   
       // NSLog(textField1.text!)
        //var lastch = textField1.text!.characters.last!
        //let rangeofChars = textField1.text!.rangeOfCharacterFromSet(letters.invertedSet)
        
        //var enteredByUser =
        
       
        
        let enteredByUserN = textField.text!
            .componentsSeparatedByCharactersInSet(unsafeChars)
            .joinWithSeparator("")
        NSLog(enteredByUserN)
        
        
        if textField.text!.rangeOfCharacterFromSet(letters.invertedSet) != nil {
            print("invalid")
            
           textField.text = enteredByUserN
        }
        
     //
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField)
    {
        let enteredByUserN = textField.text!
            .componentsSeparatedByCharactersInSet(unsafeChars)
            .joinWithSeparator("")
        
        if textField.text!.rangeOfCharacterFromSet(letters.invertedSet) != nil {
           textField.text = enteredByUserN
        }
        
    }
    
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
               // game.loadCategoriesForNewGame(<#T##numberOfCategories: Int##Int#>, responseActionHandler: { (error) in
                    //code
                    
                    game.loadCategoriesForNewGame(numberOfCategories, responseActionHandler: { (error) -> () in
                        
                        if error == nil {
                            // TODO: Load UI
                        } else {
                            print("Error trying to load categories: \(error)")
                        }
                        
    
                })
                
                //
                
                destinationViewController.game = game
            }
        }
        
        
    }
    
    //<#code#>
}

