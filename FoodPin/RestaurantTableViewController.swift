//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Melissa Verduci on 28/02/2015.
//  Copyright (c) 2015 Melissa Verduci. All rights reserved.
//
import UIKit

class RestaurantTableViewController: UITableViewController {

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
        
        //vide titre bouton retour
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
            
            
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail"
        {

            if let indexPath = self.tableView.indexPathForSelectedRow()
            {
                let restaurant = restaurants[indexPath.row]
                let destinatonController = segue.destinationViewController as DetailViewController
                destinatonController.restaurant = restaurant
            }
        }
    }
    
    func checkPlace(isVisited: Bool) ->String
    {
        if isVisited
        {
            return "Not yet"
        }
        else
        {
            return "Ive been here"
        }
        
    }
/*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) 
    {
            
            //definir le menu
            let optionMenu = UIAlertController(title: nil, message: "What do u wanna do?", preferredStyle: .ActionSheet)
            
            //definir un element du menu
            let cancelAction = UIAlertAction(title: "cancel", style: .Cancel, handler: nil)
            
            let callActionHandler = { (action:UIAlertAction!) -> Void in
                let alertMessage = UIAlertController(title: "Service Unavailable",message: "Sorry,the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
                alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(alertMessage, animated: true, completion: nil)
            }
        
            let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)",
                                            style: UIAlertActionStyle.Default, handler: callActionHandler)

        
            let callVisitedHandler = { (action:UIAlertAction!) -> Void in
                let cell = tableView.cellForRowAtIndexPath(indexPath)
                if self.restaurantIsVisited[indexPath.row]
                {
                    self.restaurantIsVisited[indexPath.row] = false
                    cell?.accessoryType = .None
                }
                else
                {
                    self.restaurantIsVisited[indexPath.row] = true
                    cell?.accessoryType = .Checkmark
                }

            }
            
            
            let isVisitedAction = UIAlertAction(title: checkPlace(self.restaurantIsVisited[indexPath.row]),
                                                style: .Default, handler: callVisitedHandler)
            
            
            
            //ajout l'element au menu
            optionMenu.addAction(callAction)
            optionMenu.addAction(cancelAction)
            optionMenu.addAction(isVisitedAction)
            
            //affiche le menu
            self.presentViewController(optionMenu, animated: true, completion: nil)
        
            //deselectionne la ligne
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
*/    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as CustomTableViewCell
        let restaurant = restaurants[indexPath.row]

        cell.nameLabel.text = restaurant.name
        cell.typeLabel.text = restaurant.type
        cell.locationLabel.text = restaurant.location
        
        cell.thumbnailImageView.image = UIImage(named: restaurant.image)
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        if (restaurant.isVisited)
        {
            cell.accessoryType = .Checkmark
        }
        else
        {
            cell.accessoryType = .None
        }
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurants.count
    }
    
    
    //affichage du bouton delete
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath:NSIndexPath)
    {
        if editingStyle == .Delete
        {
            //on supprime l'idx du restau dans ts les tableaux
            self.restaurants.removeAtIndex(indexPath.row)
        }
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }

    
    //permet d'ajouter une action custom a une row
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]?
    {
        let callActionShare = { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style: UIAlertActionStyle.Default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style: UIAlertActionStyle.Default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: UIAlertActionStyle.Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            self.presentViewController(shareMenu, animated: true, completion: nil)
        }
        
        let callDeleteAction = { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            self.restaurants.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        
        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: callActionShare)
        shareAction.backgroundColor = UIColor.blueColor()
        var deleteAtion = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: callDeleteAction)
        deleteAtion.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue:
            51.0/255.0, alpha: 1.0)
        return [deleteAtion, shareAction]
    }
    
}
