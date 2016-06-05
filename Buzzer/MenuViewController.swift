//
//  ViewController.swift
//  Buzzer
//
//  Created by leafranco on 2016-05-04.
//  Copyright © 2016 dfranco. All rights reserved.
//

import UIKit
import AVFoundation

class MenuViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var soundSwitch: UISwitch!
    

    @IBAction func soundSwitchToggle(sender: AnyObject) {
        
        
        if soundSwitch.on
        {
            soundSwitch.setOn(true, animated:true)
        }
        else{
            soundSwitch.setOn(false, animated:true)
            
        }
        playJeopardy()
       
        
    }
    
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.MotionShake {
            
            print("Device was shaken")
            if soundSwitch.on
            {
                soundSwitch.setOn(false, animated:true)
            }
            else{
                soundSwitch.setOn(true, animated:true)
                
            }
            playJeopardy()

            
        }
        
    }
    
    func playJeopardy() {
        let audioPath = NSBundle.mainBundle().pathForResource("Jeopardy-theme-song", ofType: "mp3")!
        
        
        do {
            
            try audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))

           
           // {
           //     soundSw
           // }
            if soundSwitch.on {
                audioPlayer.play()
                NSUserDefaults.standardUserDefaults().setObject("ON", forKey: "JeopardySoundFlag")
            }
            else
            {
                audioPlayer.stop()
                NSUserDefaults.standardUserDefaults().setObject("OFF", forKey: "JeopardySoundFlag")
            }
            
            

            
        } catch {
            print("Error getting the audio file")
        }
    }
    
    override func viewDidAppear(animated: Bool) {
       // print("Did Appear")
        playJeopardy()
    }
    
    func swiped(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.Left:
                print("User swiped Left")
                self.performSegueWithIdentifier("playMenuIdentifier", sender: self)
            default:
                break
            }

        }
        print("swiped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let soundOn  = NSUserDefaults.standardUserDefaults().objectForKey("JeopardySoundFlag") as? String
      
        if soundOn == "ON"        {
            soundSwitch.setOn(true, animated:true)
        }
        else {
            soundSwitch.setOn(false, animated:true)
            
        }
        

        playJeopardy()
        print("ViewDidLoad")
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(MenuViewController.swiped))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func playGame(sender: AnyObject) {
        //print("Hello")
        activityIndicator.startAnimating()
        
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC)))
        
        dispatch_after(time, dispatch_get_main_queue())
        {
            self.activityIndicator.stopAnimating()
        }
        audioPlayer.stop()
       //NSUserDefaults.standardUserDefaults().setObject("OFF", forKey: "JeopardySoundFlag")
    }
}

