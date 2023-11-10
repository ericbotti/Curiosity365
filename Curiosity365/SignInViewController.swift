//
//  SignInViewController.swift
//  Curiosity365
//
//  Created by Eric Bottinelli on 05.09.19.
//  Copyright © 2019 Eric Bottinelli. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet var image_Curiosity: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Email text field
        
        // Tolgo il rettangolo bianco in cui si scrive l'email e do un colore alla scritta
        emailTextField.backgroundColor = UIColor.clear
        emailTextField.tintColor = UIColor.white
        emailTextField.textColor = UIColor.white
        emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        // Disegna una sottile linea separatoria
        let bottomLayerEmail = CALayer()
        bottomLayerEmail.frame = CGRect(x: 0, y: 40, width: 374, height: 0.6)
        bottomLayerEmail.backgroundColor = UIColor.white.cgColor
        emailTextField.layer.addSublayer(bottomLayerEmail)
        
        // Password text field
        
        passwordTextField.backgroundColor = UIColor.clear
        passwordTextField.tintColor = UIColor.white
        passwordTextField.textColor = UIColor.white
        passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        let bottomLayerPassword = CALayer()
        bottomLayerPassword.frame = CGRect(x: 0, y: 40, width: 374, height: 0.6)
        bottomLayerPassword.backgroundColor = UIColor.white.cgColor
        passwordTextField.layer.addSublayer(bottomLayerPassword)
        
        //image_Curiosity.layer.borderWidth = 0 //senza margine foto
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
            // sending notif here
            NotificationCenter.default.post(name: heartAttackNotificationName, object: nil)
        }
    }
}
