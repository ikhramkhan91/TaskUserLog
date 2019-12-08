//
//  UserProfileViewController.swift
//  TaskUserLog
//
//  Created by Ikhram Khan on 12/7/19.
//  Copyright © 2019 IkhramDev. All rights reserved.
//

import UIKit
import SDWebImage

class UserProfileViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var emailIDLabel: UILabel!
    @IBOutlet weak var editImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    var userArray = [UserListModel.UserListDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.saveButton.isHidden = true
       
    }
    

    @IBAction func saveButtonAction(_ sender: Any) {

        self.editButton.isHidden = false
        self.editImageView.isHidden = false
        self.saveButton.isHidden = true
    }
    
    @IBAction func editButtonAction(_ sender: Any) {
        self.addressTextField.becomeFirstResponder()
        self.editButton.isHidden = true
        self.editImageView.isHidden = true
        self.saveButton.isHidden = false
    }

}

extension UserProfileViewController {
    func setupUI() {
        
        //Update Profile Image UI
        self.profileImageView.layer.masksToBounds = true
        self.profileImageView.layer.cornerRadius = 5
        self.profileImageView.layer.borderColor = UIColor.lightGray.cgColor
        self.profileImageView.layer.borderWidth = 0.5
        
        //User Details
        userNameLabel.text = userArray[0].firstName + " " + userArray[0].lastName
        phoneNumberTextField.text = "\(userArray[0].phone)"
        addressTextField.text = userArray[0].address
        emailIDLabel.text = userArray[0].email
        profileImageView.sd_setImage(with: URL(string: userArray[0].profileImage), placeholderImage: UIImage(named: "placeholder"))

    }
}
