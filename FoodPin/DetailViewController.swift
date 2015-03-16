//
//  DetailViewController.swift
//  FoodPin
//
//  Created by Melissa Verduci on 12/03/2015.
//  Copyright (c) 2015 Melissa Verduci. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet var restaurantImageView:UIImageView!
    @IBOutlet var tableView:UITableView!
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ce qui est charge une fois la vue chargee
        self.restaurantImageView.image = UIImage(named: restaurant.image)
        
        //met le background a gris
        self.tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        
        //enleve le footer
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
        //change la couleur des separateurs
        self.tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)

        //affiche le nom du restaurant en titre de la view
        title = self.restaurant.name
        
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as DetailTableViewCell
            switch indexPath.row
            {
            case 0:
                cell.fieldLabel.text = "Name"
                cell.valueLabel.text = restaurant.name
            case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
            case 2:
                cell.fieldLabel.text = "Location"
                cell.valueLabel.text = restaurant.location
            case 3:
                cell.fieldLabel.text = "Been here"
                cell.valueLabel.text = (restaurant.isVisited) ? "yes" : "no"
            default:
                cell.fieldLabel.text = ""
                cell.valueLabel.text = ""

        }
        //met le BG transparent pour le que le BG cell = BG tablebview
        cell.backgroundColor = UIColor.clearColor()
        return cell        
    }
    
    
    @IBAction func close(segue:UIStoryboardSegue)
    {
        
    }
}
