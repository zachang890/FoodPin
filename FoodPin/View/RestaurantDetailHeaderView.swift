//
//  RestaurantDetailHeaderView.swift
//  FoodPin
//
//  Created by Zachary Chang on 8/23/20.
//  Copyright © 2020 Zachary Chang. All rights reserved.
//

import UIKit

class RestaurantDetailHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    @IBOutlet var typeLabel: UILabel! {
        didSet {
            typeLabel.layer.cornerRadius = 5.0
            typeLabel.layer.masksToBounds = true
        }
    }
    @IBOutlet var checkMarkImageView: UIImageView! {
        didSet {
            checkMarkImageView.image = UIImage(named: "Homei")?.withRenderingMode(.alwaysTemplate)
            checkMarkImageView.tintColor = .white //doesnt work too properly
        }
    }

}
