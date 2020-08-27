//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Zachary Chang on 8/21/20.
//  Copyright © 2020 Zachary Chang. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    override func viewDidAppear(_ animated: Bool) {
//        navigationController?.navigationBar.barStyle = .black
//    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
                cell.iconImageView.image = UIImage(systemName: "phone")?.withTintColor(.black, renderingMode: .alwaysOriginal)
                cell.shortTextLabel.text = restaurant.phone
                cell.selectionStyle = .none
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
                cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal)
                cell.shortTextLabel.text = restaurant.location
                cell.selectionStyle = .none
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
                cell.descriptionLabel.text = restaurant.description
                cell.selectionStyle = .none
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparatorCell.self), for: indexPath) as! RestaurantDetailSeparatorCell
                cell.titleLabel.text = "HOW TO GET HERE"
                cell.selectionStyle = .none
                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
                cell.selectionStyle = .none
                return cell
            default:
                fatalError("Failed to instantiate the table view cell for detail view controller") }
    }
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() { //CALLED ONLY ONCE
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.headerImageView.image = UIImage(named: restaurant.image)
        headerView.checkMarkImageView.isHidden = (restaurant.isVisited) ? false: true
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none //no lines in between
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        tableView.contentInsetAdjustmentBehavior = .never //shifts image view back up
        
        navigationController?.hidesBarsOnSwipe = true

    }
    
    override func viewWillAppear(_ animated: Bool) { //CALLED EVERY TIME VIEW APPEARS
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barStyle = .black
    }
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurantDetailHeaderView!
    

}

//class RestaurantDetailViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        restaurantImageView.image = UIImage(named: restaurant.image)
//        nameLabelView.text = restaurant.name
//        typeLabelView.text = restaurant.type
//        locationLabelView.text = restaurant.location
//
//        navigationItem.largeTitleDisplayMode = .never
//        // Do any additional setup after loading the view.
//    }
//
//    @IBOutlet var restaurantImageView: UIImageView!
//    @IBOutlet var nameLabelView: UILabel!
//    @IBOutlet var typeLabelView: UILabel!
//    @IBOutlet var locationLabelView: UILabel!
//
//    var restaurant = Restaurant()
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
