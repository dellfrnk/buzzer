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
    
    
    
    
    @IBOutlet weak var soundSwitch: UISwitch!
    

    @IBAction func soundSwitchToggle(sender: AnyObject) {
        
        playJeopardy()
       
        
    }
    
    func playJeopardy() {
        let audioPath = NSBundle.mainBundle().pathForResource("Jeopardy-theme-song", ofType: "mp3")!
        
        
        do {
            
            try audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))

            if soundSwitch.on {
                audioPlayer.play()
            }
            else
            {
                audioPlayer.stop()
            }
            
        } catch {
            print("Error getting the audio file")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playJeopardy()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func playGame(sender: AnyObject) {
        print("Hello")
        audioPlayer.stop()
    }
}

