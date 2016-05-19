//
//  QuestionBuzzViewController.swift
//  Buzzer
//
//  Created by leafranco on 2016-05-18.
//  Copyright © 2016 dfranco. All rights reserved.
//

import UIKit

class QuestionBuzzViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var questionTextLabel: UITextView!
    @IBOutlet weak var categoryPriceLabel: UILabel!
    @IBOutlet weak var player1Button: UIButton!
    
    @IBOutlet weak var player2Button: UIButton!
    
    @IBOutlet weak var playerButton: UIButton!
    
    
    var game: Game?
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
