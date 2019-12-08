//
//  UserListViewController.swift
//  TaskUserLog
//
//  Created by Ikhram Khan on 12/7/19.
//  Copyright © 2019 IkhramDev. All rights reserved.
//

import UIKit
import SDWebImage

class UserListViewController: UIViewController {

    @IBOutlet var usersTableView: UITableView!
    let viewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.parseJsonForUserList()
        usersTableView.reloadData()
       
    }
}


extension UserListViewController:UITableViewDataSource,UITableViewDelegate {
       // MARK: - Table view data source
       func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return userArray().count
       }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // #warning Incomplete implementation, return the number of rows
           return 1
       }

    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserListTableVIewCell
           cell.userFirstName.text = userArray()[indexPath.section].firstName
           cell.userSurName.text = userArray()[indexPath.section].lastName
           cell.profileImageView.sd_setImage(with: URL(string: userArray()[indexPath.section].profileImage), placeholderImage: UIImage(named: "placeholder"))
           return cell
       }
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 110
      }
    
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
           vc.userArray = [userArray()[indexPath.section]]
           self.navigationController?.pushViewController(vc, animated: true)
       }
    
}

extension UserListViewController {
    func setupUI() {
        self.navigationItem.setHidesBackButton(true, animated:true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutAction))
        
    }
    func userArray() -> [UserListModel.UserListDetails] {
        return viewModel.userListArray()
    }
    @objc func logoutAction()  {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let customViewControllersArray : NSArray = [newViewController]
        self.navigationController?.viewControllers = customViewControllersArray as! [UIViewController]
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}

