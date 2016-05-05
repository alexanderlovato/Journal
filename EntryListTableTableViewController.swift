//
//  EntryListTableTableViewController.swift
//  Journal
//
//  Created by Alexander Lovato on 5/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryListTableTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }



    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return EntryController.sharedController.entries.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EntryCell", forIndexPath: indexPath)

        let entry = EntryController.sharedController.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let entry = EntryController.sharedController.entries[indexPath.row]
            
            EntryController.sharedController.removeEntry(entry)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
   
            
        }    
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toViewEntry" {
            
            if let detailViewController = segue.destinationViewController as? EntryDetailViewController{
                
                // You could refer to the "_" as a ghost variable, something you'll use only here. The "_" here is used to check if the value contains any data.
                _ = detailViewController.view
                
                let indexPath = tableView.indexPathForSelectedRow
                //Pay attention to the "SelectedRow" part.
                
                if let selectedRow = indexPath?.row {
                    let entry = EntryController.sharedController.entries[selectedRow]
                    detailViewController.updateWithEntry(entry)
                }
            }
        }
    }

}

// Control + Command + E - Will allow you to select every word with those letters and edit them all at once.







