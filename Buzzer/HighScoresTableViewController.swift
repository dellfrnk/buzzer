//
//  HighScoresTableViewController.swift
//  Buzzer
//
//  Created by leafranco on 2016-06-08.
//  Copyright © 2016 dfranco. All rights reserved.
//

import UIKit
import CoreData

class HighScoresTableViewController: UITableViewController {
    
    
    //HighScore is from the highscore class
    var highScores: [HighScore] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadHighScores()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadHighScores()
    {
        //appdelegate coredata, push notif, etc
        //safe
        guard let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate else {return}
        
        let fetchRequest = NSFetchRequest(entityName: "HighScore")
        let sort = NSSortDescriptor(key: "playerScore", ascending: false)
        let sort2 =  NSSortDescriptor(key: "playerName", ascending: true)
        
        //sortdescriptors require array of nssortdesc
        
        fetchRequest.sortDescriptors = [sort, sort2]
        fetchRequest.fetchLimit = 5
        
        do {
            let fetchResults = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest)
            
            if let results = fetchResults as? [HighScore] {
                highScores = results
                self.tableView.reloadData()
            }
            
        } catch let error {
            print("error loading high scores: \(error)")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return highScores.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HighScoreIdentifier", forIndexPath: indexPath)
        //
        guard let highScoreCell  = cell as? HighScoreTableViewCell else {
            return cell
        }
        
        let score = highScores[indexPath.row]
        
        highScoreCell.PlayerName.text = score.playerName
        highScoreCell.PlayerScore.text = score.playerScore?.stringValue
        

        // Configure the cell...

        return highScoreCell
    }
    

    //******************************** remove these code down
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

      //******************************** remove these code up to
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
