//
//  QuestionPickerViewController.swift
//  Buzzer
//
//  Created by leafranco on 2016-05-09.
//  Copyright © 2016 dfranco. All rights reserved.
//

import UIKit

 let numberOfCategories = 4
private let questionsPerCategory = 5

class QuestionPickerViewController: UIViewController, UITextFieldDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var questionCollectionView: UICollectionView!
    var game: Game?
    
   // func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath inexPath: NSIndexPath)
    //{
        //*
   // }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowQuestionBuzzSegue" {
            if let destinationViewController = segue.destinationViewController as? QuestionBuzzViewController {
                destinationViewController.game = game
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - UICollectionViewDatasource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return numberOfCategories * questionsPerCategory
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("QuestionPrice", forIndexPath: indexPath) as? QuestionPriceCell {
            let price = priceFromIndexPath(indexPath)
            cell.priceLabel.text = "$\(price)"
            
            let categoryIndex = categoryFromIndexPath(indexPath)
            if categoryIndex < game?.categories.count {
                let category = game?.categories[categoryIndex]
                cell.answered = category?.answeredQuestions[price] != nil
            }
            
            return cell
        }
        
        return UICollectionViewCell(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
   
    /*
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("QuestionPriceID", forIndexPath: indexPath) as? QuestionPriceCell
        {
            //cell.priceLabel came from View->questionPriceCell.swift label
            
            cell.priceLabel.text = "$999"
            return cell
        }
        
        return UICollectionViewCell(frame: CGRect(x:0, y: 0, width: 100, height: 100))
    }
 */
  
    //MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectedPrice = priceFromIndexPath(indexPath)
        let selectedCategory = categoryFromIndexPath(indexPath)
        
        // Set the selected question on game object
        if let category = game?.categories[selectedCategory] {
            //if there is already an answered question for this category and price don't do anything
            
            if category.answeredQuestions[selectedPrice] != nil {
                return
            }
            
            Question.loadQuestion(category, price: selectedPrice, responseHandler: { (error, question) -> () in
                
                if error == nil {
                    
                    self.game?.currentQuestion = question
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        self.performSegueWithIdentifier("ShowQuestionBuzzSegue", sender: nil)
                    })
                    
                } else {
                    print("Error trying to load question: \(error)")
                }
                
            })        }
    }

    
    //MARK: Private
    
    private func priceFromIndexPath(indexPath: NSIndexPath) -> Int {
        let row = indexPath.item / numberOfCategories
        let price = (row + 1) * 200
        return price
    }
    
    private func categoryFromIndexPath(indexPath: NSIndexPath) -> Int {
        let column = indexPath.item % numberOfCategories
        return column
    }
    
    
    

//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return numberOfCategories * questionsPerCategory
//    }
    
   
    
    // MARK: UICollectionViewDelegateFlowLayout
   
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
       //  This should almost certainly be the correct kind of layout unless it has been changes in the storyboard
        if let layout = questionCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let interItemSpacing = layout.minimumInteritemSpacing
            let totalSpace: CGFloat = CGFloat(numberOfCategories - 1) * interItemSpacing
            let dimension = floor((questionCollectionView.bounds.width - totalSpace) / CGFloat(numberOfCategories))
            return CGSize(width: dimension, height: dimension)
        }
        
    //     Return UICollectionViewFloatLayout default size
        return CGSize(width: 20, height: 20)
    }
    
    //
}
