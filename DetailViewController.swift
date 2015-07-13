//
//  DetailViewController.swift
//  shareAndDeleteFoodPin
//
//  Created by 沈卓晨 on 15/7/4.
//  Copyright (c) 2015年 poppinlr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var detailImage:UIImageView!
//    var detailImageName:String!
    var restaurants:Restaurant!
    @IBOutlet weak var tableView:UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailImage.image = UIImage(named: restaurants.image)
        
        self.title = restaurants.name
        // Remove extra separator
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
        // Change separator color
        self.tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        self.tableView.estimatedRowHeight = 36.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("detailCell") as! DetailTableViewCell
        switch indexPath.row{
        case 0:
            cell.field.text = "name"
            cell.value.text = restaurants.name
            cell.mapButtom.hidden = true
        case 1:
            cell.field.text = "type"
            cell.value.text = restaurants.type
            cell.mapButtom.hidden = true
        case 2:
            cell.field.text = "location"
            cell.value.text = restaurants.location
            cell.mapButtom.hidden = false
        case 3:
            cell.field.text = "been here"
            cell.value.text = restaurants.isVisited ? "YES,I've been here" : "NO,I havn't been here"
            cell.mapButtom.hidden = true
        default:
            cell.field.text = ""
            cell.value.text = ""
            cell.mapButtom.hidden = true
        }
        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if "showMap" == segue.identifier{
            let mapViewController = segue.destinationViewController as! MapViewController
            mapViewController.restaurant = self.restaurants
        }
    }
    
    @IBAction func close(segue:UIStoryboardSegue){
        
    }
}
