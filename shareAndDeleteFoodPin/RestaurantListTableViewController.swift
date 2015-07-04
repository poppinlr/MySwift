//
//  RestaurantListTableViewController.swift
//  shareAndDeleteFoodPin
//
//  Created by 沈卓晨 on 15/7/2.
//  Copyright (c) 2015年 poppinlr. All rights reserved.
//

import UIKit

class RestaurantListTableViewController: UITableViewController {

    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", image: "cafedeadend.jpg", isVisited: true),
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61 York St Sydney New South Wales", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D 4SL United Kingdom", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", image: "thaicafe.jpg", isVisited: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)

        self.tableView.estimatedRowHeight = 80.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return restaurants.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("restautantCell", forIndexPath: indexPath) as! RestaurantTableViewCell

        // Configure the cell...

        cell.RestaurantImage.image = UIImage(named: restaurants[indexPath.row].image)
        cell.RestaurantImage.clipsToBounds = true
        cell.RestaurantImage.layer.cornerRadius = cell.RestaurantImage.frame.size.height/2
        cell.RestautantName.text = restaurants[indexPath.row].name
        cell.RestautantLocation.text = restaurants[indexPath.row].location
        cell.RestautantType.text = restaurants[indexPath.row].type
        cell.accessoryType = restaurants[indexPath.row].isVisited ? UITableViewCellAccessoryType.Checkmark:UITableViewCellAccessoryType.None
        
        return cell
    }
    
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let selectAlertController = UIAlertController(title: "what do you want to do ?", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
//        //cancel
//        let selectCancelAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
//        //call
//        let selectCallAlertAction = UIAlertAction(title: "call 010-XXXXXXXXX", style: UIAlertActionStyle.Default) { (action:UIAlertAction!) -> Void in
//            
//            let callAlertController = UIAlertController(title: "Sorry the function is in developing", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
//            let callAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
//            callAlertController.addAction(callAlertAction)
//            self.presentViewController(callAlertController, animated: true, completion: nil)
//        }
//        //visited
//        let visitedAlertAction = UIAlertAction(title: self.restaurants[indexPath.row].isVisited ? "I haven't been here":"I've been here", style: UIAlertActionStyle.Default) { (action:UIAlertAction!) -> Void in
//            self.restaurants[indexPath.row].isVisited = !self.restaurants[indexPath.row].isVisited
//            let cell = tableView.cellForRowAtIndexPath(indexPath) as! RestaurantTableViewCell
//            cell.accessoryType = self.restaurants[indexPath.row].isVisited ? UITableViewCellAccessoryType.Checkmark:UITableViewCellAccessoryType.None
//        }
//        selectAlertController.addAction(selectCancelAlertAction)
//        selectAlertController.addAction(selectCallAlertAction)
//        selectAlertController.addAction(visitedAlertAction)
//        
//        self.presentViewController(selectAlertController, animated: true, completion: nil)
//        
//    }

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
            restaurants.removeAtIndex(indexPath.row)
            
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
            self.restaurants.removeAtIndex(indexPath.row)
            
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        if segue.identifier == "toDetailView"{
            let detailController = segue.destinationViewController as!DetailViewController
            if let rowNumber = self.tableView.indexPathForSelectedRow(){
                detailController.restaurants = restaurants[rowNumber.row]
            }
        }
        // Pass the selected object to the new view controller.
    }
}
