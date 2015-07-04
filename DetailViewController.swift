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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailImage.image = UIImage(named: restaurants.image)
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
        case 1:
            cell.field.text = "type"
            cell.value.text = restaurants.type
        case 2:
            cell.field.text = "location"
            cell.value.text = restaurants.location
        case 3:
            cell.field.text = "been here"
            cell.value.text = restaurants.isVisited ? "YES,I've been here" : "NO,I havn't been here"
        default:
            cell.field.text = ""
            cell.value.text = ""
        }
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
