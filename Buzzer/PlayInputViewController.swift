//  PlayInputViewController.swift
//  Buzzer
//
//  Created by leafranco on 2016-05-09.
//  Copyright © 2016 dfranco. All rights reserved.
//


import Foundation
import UIKit

class PlayerInputViewController : UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var playerImages: [UIImageView]!
    
    @IBOutlet weak var player1Name: UITextField!
    
    @IBOutlet weak var player2Name: UITextField!
    
    @IBOutlet weak var player3Name: UITextField!
    
    @IBOutlet weak var playButton: UIButton!
    
    
    func addGestureRecognizer(){
        for eachImageView in playerImages {
            let gestureRecognizer = UIGestureRecognizer(target: self, action: #selector(PlayerInputViewController.playerImageTapped(_:)))
            //gestureRecognizer.delegate = self
            eachImageView.addGestureRecognizer(gestureRecognizer)
            }
        
    }
    
    func playerImageTapped(sender: UITapGestureRecognizer) {
       // [self player]
        print("hello")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addGestureRecognizer()
        self.player1Name.delegate = self
        self.player2Name.delegate = self
        self.player3Name.delegate = self
        
        playButton.transform = CGAffineTransformMakeScale(0.1, 0.1)
        
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: 0.20,
                                   initialSpringVelocity: 6.00,
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    self.playButton.transform = CGAffineTransformIdentity
            }, completion: nil)
     
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)

    }
    
    func swiped(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.Left:
                print("User swiped Left")
                //self.performSegueWithIdentifier("playMenuIdentifier", sender: self)
            case UISwipeGestureRecognizerDirection.Right:
                print("User swiped Right")
                
                //self.dismissViewControllerAnimated(true, completion: {});
                self.navigationController?.popViewControllerAnimated(true);
            default:
                break
            }
            
        }
        print("swiped")
    }
    
    let unsafeChars = NSCharacterSet.alphanumericCharacterSet().invertedSet
    let letters = NSCharacterSet.alphanumericCharacterSet()
    


    

    
    
    @IBAction func playGameAction(sender: AnyObject) {
        
        var myColor : UIColor = UIColor( red: 0, green: 0, blue:0.75, alpha: 1.0 )
        
        if player1Name.text! == "" && player2Name.text! == "" && player3Name.text! == ""
        {
            myColor = UIColor( red: 0.75, green: 0, blue:0, alpha: 1.0 )
            
            if player1Name.text! == ""
            {
                 player1Name.layer.borderColor = myColor.CGColor
                 player1Name.layer.borderWidth = 1.25
            }
            if player2Name.text! == ""
            {
                player2Name.layer.borderColor = myColor.CGColor
                player2Name.layer.borderWidth = 1.25
            }
            if player3Name.text! == ""
            {
                player3Name.layer.borderColor = myColor.CGColor
                player3Name.layer.borderWidth = 1.25
            }
           
            
        }
        else {
            player1Name.layer.borderColor = myColor.CGColor
            player1Name.layer.borderWidth = 1

            player2Name.layer.borderColor = myColor.CGColor
            player2Name.layer.borderWidth = 1

            player3Name.layer.borderColor = myColor.CGColor
            player3Name.layer.borderWidth = 1

            performSegueWithIdentifier("GoToQuestionPicker", sender: nil)
        
        }
        }
    
  //  func formattedPrice() -> String {
 //       return "$\(price)"
 //   }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        print("While entering the characters this method gets called")
        
        
        
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
//        if segue.identifier == "ShowQuestionBuzzSegue" {
//            if let destinationViewController = segue.destinationViewController as? QuestionBuzzViewController {
//                destinationViewController.game = game
//            }
//        }
//    }
        
//        if segue.identifier == "ShowQuestionBuzzSegue" {
//            if let destinationViewController = segue.destinationViewController as? QuestionBuzzViewController {
//                destinationViewController.game = game
//            }
//        }
//    }
    
    
       // if segue.identifier == "ShowQuestionBuzzSegue" {
        if segue.identifier == "GoToQuestionPicker" {
            
            if let destinationViewController =  segue.destinationViewController as? QuestionPickerViewController {
                
                let player1 = Player()
                // if nil put the double quotes
                
               //player1.name = player1Name.text!
                if let enteredName = player1Name.text where enteredName.characters.count > 0
                {       player1.name = enteredName
                }
                else
                {
                    player1.name = "Player 1"
                }
                //other way - same meaning
                //player1.name = playerName.text ?? "Player 1"
                
                
                let player2 = Player()
                if let enteredName = player2Name.text where enteredName.characters.count > 0 {
                    player2.name = enteredName
                }
                else {
                    player2.name = "Player 2"
                }
                
                let player3 = Player()
                if let enteredName = player3Name.text where enteredName.characters.count > 0 {
                    player3.name = enteredName
                }
                else {
                    player3.name = "Player 3"
                }
            
//                let player2 = Player()
//                // if nil put the double quotes
//                player2.name = player2Name.text ?? ""
//                
//                let player3 = Player()
//                // if nil put the double quotes
//                player3.name = player3Name.text ?? ""
                
                let game = Game()
                game.player1 = player1
                game.player2 = player2
                game.player3 = player3
                
                game.loadCategoriesForNewGame(numberOfCategories, responseActionHandler: { (error) -> () in
                        
                        if error == nil {
                            // TODO: Load UI
                        } else {
                            print("Error trying to load categories: \(error)")
                        }
                        
    
                })
                
                game.currentPlayer = player1
                
                //
                
                destinationViewController.game = game
            }
        }
        
        
    }
    
    //<#code#>
}

