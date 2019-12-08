//
//  UserListTableVIewCell.swift
//  TaskUserLog
//
//  Created by Ikhram Khan on 12/7/19.
//  Copyright © 2019 IkhramDev. All rights reserved.
//

import UIKit

class UserListTableVIewCell: UITableViewCell {
    
    @IBOutlet weak var userSurName: UILabel!
    @IBOutlet weak var userFirstName: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileImageView.layer.masksToBounds = true
        self.profileImageView.layer.cornerRadius = 5
        self.profileImageView.layer.borderColor = UIColor.lightGray.cgColor
        self.profileImageView.layer.borderWidth = 0.5
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
