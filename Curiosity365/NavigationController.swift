//
//  NavigationController.swift
//  Curiosity365
//
//  Created by Eric Bottinelli on 25.02.20.
//  Copyright © 2020 Eric Bottinelli. All rights reserved.
//

import Foundation
import UIKit

class NavigationController: UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
    }
    
    private func setupNavigationBarItems() {
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "Logo_Curiosity_3_centered_gradient"))
        titleImageView.frame = CGRect(x: 0, y:0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
        
        let calendarButton = UIButton(type: .system)
        calendarButton.setImage(#imageLiteral(resourceName: "calendar").withRenderingMode(.alwaysOriginal), for: .normal)
        calendarButton.frame = CGRect(x: 0, y:0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: calendarButton)
 
    }
}
