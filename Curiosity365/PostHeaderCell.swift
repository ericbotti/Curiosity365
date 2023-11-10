//
//  PostHeaderCell.swift
//  Curiosity365
//
//  Created by Eric Bottinelli on 03.03.20.
//  Copyright © 2020 Eric Bottinelli. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell{
    @IBOutlet weak var numberImageView: UIImageView!
    @IBOutlet weak var dayOfTheYear: UIButton!
    
    var post: Post! {
        didSet{
            //updateUI()
        }
    }
    /*
    func updateUI(){
        numberImageView.image = post.createdBy.profileImage
        dayOfTheYear.setTitle(post.createdBy.username!, for: .normal)
    }
 */
}
