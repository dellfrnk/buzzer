//
//  QuestionPickerViewController.swift
//  Buzzer
//
//  Created by leafranco on 2016-05-09.
//  Copyright © 2016 dfranco. All rights reserved.
//

import UIKit

class QuestionPickerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath inexPath: NSIndexPath)
    {
        //*
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
       return 1
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("QuestionPriceID", forIndexPath: indexPath) as? QuestionPriceCell
        {
            //cell.priceLabel came from View->questionPriceCell.swift label
            
            cell.priceLabel.text = "$999"
            return cell
        }
        
        return UICollectionViewCell(frame: CGRect(x:0, y: 0, width: 100, height: 100))
    }
}
