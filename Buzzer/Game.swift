//
//  Game.swift
//  Buzzer
//
//  Created by leafranco on 2016-05-04.
//  Copyright © 2016 dfranco. All rights reserved.
//

import Foundation
class Game {
    
    var player1 : Player?
    var player2 : Player?
    var player3 : Player?

    var currentPlayer:  Player?
    
    //array, empty list
    var questions: [Question] = []
    var currentQuestion: Question?
    var categories: [Category] = []
    
    func loadCategoriesForNewGame() {
        do {
            categories = try Category.loadCategories()
        }
        catch let error {
            print("Error loading categories: \(error)")
        }
    }
    
    // with 1 arg and inside with 2 args
    
    func loadCategoriesForNewGame(numberOfCategories: Int, responseActionHandler : (error : NSError?) -> ()) {
        
        //closure with 2 args
        Category.loadCategories(numberOfCategories, responseHandler: { (error, items) -> () in
            self.categories = items!
            
            if let categoriesArray = items {
                self.categories = categoriesArray
            }
            
            responseActionHandler(error: error)
            
        })
    }
    
    func currentPlayerGotItRight()
    {
        guard let currentPlayer = currentPlayer else { return }
        guard let price = currentQuestion?.price else
        { return}
        currentPlayer.score += price
    }

    
    func currentPlayerGotItWrong()
    {
        guard let currentPlayer = currentPlayer else { return }
        guard let price = currentQuestion?.price else
        { return}
        currentPlayer.score -= price
    }
}