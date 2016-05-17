//
//  QuestionPriceCell.swift
//  Buzzer
//
//  Created by leafranco on 2016-05-11.
//  Copyright © 2016 dfranco. All rights reserved.
//

import UIKit

class QuestionPriceCell : UICollectionViewCell {


    @IBOutlet weak var priceLabel: UILabel!
    
    var answered = false {
        //action - monitors, observe what happens to a variable
        //hide price label if answered is set
        didSet {
            priceLabel.hidden = answered
            
        }
        willSet {
            //make visible and then set for e.g.
            print("set the value of whatever")
        }
    }
}

