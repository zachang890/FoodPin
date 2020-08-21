//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Zachary Chang on 8/21/20.
//  Copyright © 2020 Zachary Chang. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantImageView.image = UIImage(named: restaurantImageName)

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var restaurantImageView: UIImageView!
    
    var restaurantImageName = ""
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
