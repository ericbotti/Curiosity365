//
//  NewsfeedViewController.swift
//  Curiosity365
//
//  Created by Eric Bottinelli on 03.03.20.
//  Copyright © 2020 Eric Bottinelli. All rights reserved.
//

import UIKit

class NewsfeedViewController: UITableViewController{
    var posts: [Post]?
    
    struct Storyboard {
        static let postCell = "PostCell"
        static let postHeaderCell = "PostHeaderCell"
        static let postHeaderHeight: CGFloat = 56.0
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupNavigationBarItems()
        
        //self.fetchPosts()
    }
    /*
    func fetchPosts(){
        posts = Post.fetchPosts()
        tableView.reloadData()
    }
 */
    
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
/*
extension NewsfeedViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let posts = posts {
            return posts.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts != nil {
            return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.postCell, for: indexPath) as! PostCell
        
        cell.post = posts?[indexPath.section]
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.postHeaderCell) as! PostHeaderCell
        
        cell.post = posts?[section]
        cell.backgroundColor = .white
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section : Int) -> CGFloat {
        return Storyboard.postHeaderHeight
    }
 */




