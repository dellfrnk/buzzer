//
//  Category.swift
//  Buzzer/Users/leafranco/Documents/myfiles/Buzzer/Buzzer/Base.lproj/Main.storyboard
//
//  Created by leafranco on 2016-05-04.
//  Copyright © 2016 dfranco. All rights reserved.
//

import Foundation

class Category {
    var id = 0
    var title = ""
    var cluesCount = 0
    //empty dictionary
    var answeredQuestions: [Int: Question] = [:]
}