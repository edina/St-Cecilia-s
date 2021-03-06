//
//  CollectionsTableViewController.swift
//  StCecelias
//
//  Created by Colin Gormley on 20/05/2016.
//  Copyright © 2016 Edina. All rights reserved.
//

import UIKit
import CoreData

class CollectionsTableViewController: UITableViewController {

    var collections = [Collection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = NSFetchRequest(entityName: Constants.Entity.collection)
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        collections = (try! self.dataStack.mainContext.executeFetchRequest(request)) as! [Collection]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.collections.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.ReuseIDs.collectionCell, forIndexPath: indexPath)

        let collection = self.collections[indexPath.row]
        cell.textLabel?.text = collection.name
        cell.detailTextLabel?.text = collection.count?.stringValue
        
        return cell
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        if segue.identifier == Constants.SegueIDs.showCollectionItems {
//            if let destination = segue.destinationViewController as? CollectionItemsTableViewController {
//                if let collectionIndex = tableView.indexPathForSelectedRow?.row {
//                    destination.collection = self.collections[collectionIndex]
//                }
//            }
//        }
    }
    

}
