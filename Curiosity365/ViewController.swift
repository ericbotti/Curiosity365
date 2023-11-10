//
//  ViewController.swift
//  Curiosity365
//
//  Created by Eric Bottinelli on 24.07.19.
//  Copyright © 2019 Eric Bottinelli. All rights reserved.
//

import UIKit
import LBTAComponents
import RevealingSplashView

class ViewController: UIViewController {
    
    let background: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "BackgroundColor")
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    let revealingSplashView = RevealingSplashView(iconImage: #imageLiteral(resourceName: "Logo365"), iconInitialSize: CGSize(width: 123, height: 123), backgroundColor: UIColor(r:78, g:172, b:248))

    override func viewDidLoad() {
        super.viewDidLoad()

         //view.setGradientBackground(colorOne: Colors.lightBlueLogo, colorTwo: Colors.darkBlueLogo) //Setting del colore di sfondo della main page (del ViewController in questo caso)
        
    }
    
    
    func setupViews(){
        view.addSubview(background)
        view.addSubview(revealingSplashView)
        
        background.fillSuperview()
        revealingSplashView.animationType = .swingAndZoomOut
        revealingSplashView.startAnimation()
    }


}

