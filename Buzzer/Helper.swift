//
//  Helper.swift
//  Buzzer
//
//  Created by leafranco on 2016-06-12.
//  Copyright © 2016 dfranco. All rights reserved.
//

import Foundation
import UIKit

class Helper
{
   // static var x = 1
    var swipedLeft : Bool = false
    
    func swiped(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.Left:
                print("User swiped Left")
                swipedLeft = true
               
            case UISwipeGestureRecognizerDirection.Right:
                print("User swiped Right")
            
                
                //self.dismissViewControllerAnimated(true, completion: {});
              //  self.navigationController?.popViewControllerAnimated(true);
            default:
                break
            }
            
        }
        print("swiped")
       // print(Helper.x)
    }
    
}
