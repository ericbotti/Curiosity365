//
//  HomeViewController.swift
//  Curiosity365
//
//  Created by Eric Bottinelli on 02.09.19.
//  Copyright © 2019 Eric Bottinelli. All rights reserved.
//

import UIKit
import LBTAComponents
import RevealingSplashView

class HomeViewController: UIViewController {
    
    /* Se voglio aggiungere un immagine come sfondo
    let background: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "BackgroundColor.png")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        //setupViews() Richiamo della funzione per l'imamgine di sfondo
        //view.setGradientBackground(colorOne: Colors.lightBlueLogo, colorTwo: Colors.darkBlueLogo) //Setting del colore di sfondo col gradiente della main page (del ViewController in questo caso)

        //view.backgroundColor = UIColor.red per mettere lo sfondo rosso
        
        /*BLOCCO
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
            // sending notif here
            NotificationCenter.default.post(name: heartAttackNotificationName, object: nil)
        }
 FINE*/
        //addNavBarImage() //aggiungere l'immagine alla Navigation Bar
        
    
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
/*
    func addNavBarImage() { //funzione per aggiungere immagine alla navigation Bar
        
        let navController = navigationController!
        
        let image = #imageLiteral(resourceName: "Logo_Curiosity_3_centered_gradient.png")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - image.size.width / 2
        let bannerY = bannerHeight / 2 - image.size.height / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
    }
 */
    
/*
    func setupViews(){
        view.addSubview(background)
        
        background.fillSuperview()
    }
*/
    
}

