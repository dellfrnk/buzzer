//
//  QuestionPickerViewController.swift
//  Buzzer
//
//  Created by leafranco on 2016-05-09.
//  Copyright © 2016 dfranco. All rights reserved.
//

import UIKit

class QuestionPickerViewController: UIViewController, UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var questionCollectionView: UICollectionView!
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath inexPath: NSIndexPath)
    {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
