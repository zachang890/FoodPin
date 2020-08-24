//
//  UINavigationController+Ext.swift
//  FoodPin
//
//  Created by Zachary Chang on 8/24/20.
//  Copyright © 2020 Zachary Chang. All rights reserved.
//

import Foundation

import UIKit

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
