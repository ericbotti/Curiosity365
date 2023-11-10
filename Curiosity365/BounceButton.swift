//
//  BounceButton.swift
//  Curiosity365
//
//  Created by Eric Bottinelli on 26.01.20.
//  Copyright © 2020 Eric Bottinelli. All rights reserved.
//

// Tentativo di creare dei bottoni interattivi
// Attualmente non utilizzato

import UIKit

class BounceButton: UIButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1) //rende il bottone 110% più grande
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations:{
            self.transform = CGAffineTransform.identity //ritorna alla grandezza originale
        }, completion: nil)
        
        super.touchesBegan(touches, with: event)
    }
}
