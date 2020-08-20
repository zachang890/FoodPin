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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //DISPLAY ALERT
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet) //.alert instead of .actionSheet would pop up the center screen alert
        
        
        //Basically you need to do this to accomodate IPAD because ipad has different type of popups
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        //GIVE USERS A CHOICE OF WHAT TO DO
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil) //handler is nil because nothing is performed as a result of a cancel
        optionMenu.addAction(cancelAction)
        
        //ALSO REFERRED TO AS "CLOSURE"
        //CALLING ACTION, just like the previous handler, except we give it something to do this time instead of nil
        let callActionHandler = { (action:UIAlertAction!) -> Void in //"in" denotes the end of parameters and return type
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        
        //CHECK-IN -- another way to do CLOSURE (embedded)
        let checkInButtonTitle = self.restaurantIsVisited[indexPath.row] ? "Undo Check in" : "Check in"
        
        let checkInAction = UIAlertAction(title: checkInButtonTitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .none : .checkmark
            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
        })
        optionMenu.addAction(checkInAction)
    
        
        //DISPLAY IT
        present(optionMenu, animated: true, completion: nil)
        //So the row doesn't stay gray
        tableView.deselectRow(at: indexPath, animated: false)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
