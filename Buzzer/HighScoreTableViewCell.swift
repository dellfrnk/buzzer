//
//  HighScoreTableViewCell.swift
//  Buzzer
//
//  Created by leafranco on 2016-06-13.
//  Copyright © 2016 dfranco. All rights reserved.
//

import UIKit

class HighScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var PlayerName: UILabel!
    @IBOutlet weak var PlayerScore: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //awake from the model, from the interface build
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
