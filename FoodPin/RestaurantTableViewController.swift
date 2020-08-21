//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Zachary Chang on 8/18/20.
//  Copyright © 2020 Zachary Chang. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery" , "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = Array(repeating: false, count: 21)

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    //Remember that this function is called EVERY time a row is about to be displayed
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell //downcasting, to return RestaurantTableViewCell instead of the default cell
        
        //basically to prevent checkmarks from being displayed where it shouldnt be
        if restaurantIsVisited[indexPath.row] {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantNames[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurantImageName = restaurantNames[indexPath.row]
            }
        }
    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        //DISPLAY ALERT
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet) //.alert instead of .actionSheet would pop up the center screen alert
//
//
//        //Basically you need to do this to accomodate IPAD because ipad has different type of popups
//        if let popoverController = optionMenu.popoverPresentationController {
//            if let cell = tableView.cellForRow(at: indexPath) {
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//        //GIVE USERS A CHOICE OF WHAT TO DO
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil) //handler is nil because nothing is performed as a result of a cancel
//        optionMenu.addAction(cancelAction)
//
//        //ALSO REFERRED TO AS "CLOSURE"
//        //CALLING ACTION, just like the previous handler, except we give it something to do this time instead of nil
//        let callActionHandler = { (action:UIAlertAction!) -> Void in //"in" denotes the end of parameters and return type
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//
//
//        //CHECK-IN -- another way to do CLOSURE (embedded)
//        let checkInButtonTitle = self.restaurantIsVisited[indexPath.row] ? "Undo Check in" : "Check in"
//
//        let checkInAction = UIAlertAction(title: checkInButtonTitle, style: .default, handler: {
//            (action:UIAlertAction!) -> Void in
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .none : .checkmark
//            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
//        })
//        optionMenu.addAction(checkInAction)
//
//
//        //DISPLAY IT
//        present(optionMenu, animated: true, completion: nil)
//        //So the row doesn't stay gray
//        tableView.deselectRow(at: indexPath, animated: false)
//    }
    
    
    

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //destructive makes the button red
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            completionHandler(true) //dismiss the action button
        }
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(systemName: "trash")
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]

            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: self.restaurantNames[indexPath.row]) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                //pulls up like the sharing screen thing, the defaultText is passed and can be shared with others
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            //accomodate once again for the IPAD
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let checkAction = UIContextualAction(style: .normal, title: "Check/Uncheck") { (action, sourceView, completionHandler) in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .none : .checkmark
            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
            
            completionHandler(true)
        }
        checkAction.backgroundColor = UIColor(red: 20/255.0, green: 172/255.0, blue: 61/255.0, alpha: 1.0)
        checkAction.image = self.restaurantIsVisited[indexPath.row] ? UIImage(systemName: "arrow.uturn.left") : UIImage(systemName: "checkmark")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkAction])
        return swipeConfiguration
    }
}

