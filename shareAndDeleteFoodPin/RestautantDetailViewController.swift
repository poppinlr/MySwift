//
//  DetailViewController.swift
//  shareAndDeleteFoodPin
//
//  Created by 沈卓晨 on 15/7/3.
//  Copyright (c) 2015年 poppinlr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var tableView:UITableView!
    
    @IBOutlet var detailImage:UIImageView!
    var detailImageName:String!
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 36.0;
        tableView.rowHeight = UITableViewAutomaticDimension;
        
        // Do any additional setup after loading the view.
        detailImage.image = UIImage(named:detailImageName)
        self.tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:
            240.0/255.0, alpha: 0.2)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView.separatorColor = UIColor(red:240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0,
            alpha: 0.8)
       
        self.title = restaurant.name
        
        navigationController?.hidesBarsOnSwipe = false
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as!RestaurantDetailCellTableViewCell
        switch indexPath.row{
        case 0:
            cell.fieldLabel.text = "name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "visited"
            cell.valueLabel.text = restaurant.isVisited ? "I've been here":"I haven't been here"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
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
