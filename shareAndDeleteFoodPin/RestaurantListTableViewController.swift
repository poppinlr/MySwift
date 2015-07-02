//
//  RestaurantListTableViewController.swift
//  shareAndDeleteFoodPin
//
//  Created by 沈卓晨 on 15/7/2.
//  Copyright (c) 2015年 poppinlr. All rights reserved.
//

import UIKit

class RestaurantListTableViewController: UITableViewController {

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantVisited = [Bool](count: 21, repeatedValue: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return restaurantNames.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("restautantCell", forIndexPath: indexPath) as! RestaurantTableViewCell

        // Configure the cell...

        cell.RestaurantImage.image = UIImage(named: restaurantImages[indexPath.row])
        cell.RestaurantImage.clipsToBounds = true
        cell.RestaurantImage.layer.cornerRadius = cell.RestaurantImage.frame.size.height/2
        cell.RestautantName.text = restaurantNames[indexPath.row]
        cell.RestautantLocation.text = restaurantLocations[indexPath.row]
        cell.RestautantType.text = restaurantTypes[indexPath.row]
        cell.accessoryType = restaurantVisited[indexPath.row] ? UITableViewCellAccessoryType.Checkmark:UITableViewCellAccessoryType.None
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectAlertController = UIAlertController(title: "what do you want to do ?", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        //cancel
        let selectCancelAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        //call
        let selectCallAlertAction = UIAlertAction(title: "call 010-XXXXXXXXX", style: UIAlertActionStyle.Default) { (action:UIAlertAction!) -> Void in
            
            let callAlertController = UIAlertController(title: "Sorry the function is in developing", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            let callAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
            callAlertController.addAction(callAlertAction)
            self.presentViewController(callAlertController, animated: true, completion: nil)
        }
        //visited
        let visitedAlertAction = UIAlertAction(title: self.restaurantVisited[indexPath.row] ? "I haven't been here":"I've been here", style: UIAlertActionStyle.Default) { (action:UIAlertAction!) -> Void in
            self.restaurantVisited[indexPath.row] = !self.restaurantVisited[indexPath.row]
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! RestaurantTableViewCell
            cell.accessoryType = self.restaurantVisited[indexPath.row] ? UITableViewCellAccessoryType.Checkmark:UITableViewCellAccessoryType.None
        }
        selectAlertController.addAction(selectCancelAlertAction)
        selectAlertController.addAction(selectCallAlertAction)
        selectAlertController.addAction(visitedAlertAction)
        
        self.presentViewController(selectAlertController, animated: true, completion: nil)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            restaurantImages.removeAtIndex(indexPath.row)
            restaurantNames.removeAtIndex(indexPath.row)
            restaurantLocations.removeAtIndex(indexPath.row)
            restaurantTypes.removeAtIndex(indexPath.row)
            restaurantVisited.removeAtIndex(indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

    
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "share") { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            let shareAlertCtrl = UIAlertController(title: "which way do you want to share ?", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            let shareAlertActionWeiBo = UIAlertAction(title: "share by weibo", style: UIAlertActionStyle.Default) { (action:UIAlertAction!) -> Void in
                let shareSuccessCtrl = UIAlertController(title: "share success", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                let shareSuccessAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
                shareSuccessCtrl.addAction(shareSuccessAction)
                self.presentViewController(shareSuccessCtrl, animated: true, completion: nil)
            }
            let shareAlertActionWeiXin = UIAlertAction(title: "share by weixin", style: UIAlertActionStyle.Default) { (action:UIAlertAction!) -> Void in
                let shareFailCtrl = UIAlertController(title: "share fail", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                let shareFailAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
                shareFailCtrl.addAction(shareFailAction)
                self.presentViewController(shareFailCtrl, animated: true, completion: nil)
            }
            let shareAlertActionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            shareAlertCtrl.addAction(shareAlertActionWeiBo)
            shareAlertCtrl.addAction(shareAlertActionWeiXin)
            shareAlertCtrl.addAction(shareAlertActionCancel)
            
            self.presentViewController(shareAlertCtrl, animated: true, completion: nil)
        }
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "delete") { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            self.restaurantImages.removeAtIndex(indexPath.row)
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantVisited.removeAtIndex(indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
        shareAction.backgroundColor = UIColor.blackColor()
        deleteAction.backgroundColor = UIColor.redColor()
        
        return [deleteAction,shareAction]
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
