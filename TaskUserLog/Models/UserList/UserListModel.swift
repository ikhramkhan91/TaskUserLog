//
//  UserListModel.swift
//  TaskUserLog
//
//  Created by Ikhram Khan on 12/8/19.
//  Copyright © 2019 IkhramDev. All rights reserved.
//

import Foundation

class UserListModel {
struct UserListDetails {
    let firstName: String
    let lastName: String
    let dob: String
    var address: String
    let email: String
    let password: String
    let profileImage: String
    var phone: Int
    
    init?(_ json: [String: Any]) {
    guard let firstNameStr = json["firstName"] as? String,
        let lastNameStr = json["lastName"] as? String,
        let dobStr = json["dob"] as? String,
        let addressStr = json["address"] as? String,
        let emailStr = json["email"] as? String,
        let passwordStr = json["password"] as? String,
        let profileImg = json["profileImage"] as? String,
        let phoneInt = json["phone"] as? Int
       
    else {
        return nil
    }
        
            self.firstName = firstNameStr
            self.lastName = lastNameStr
            self.dob = dobStr
            self.address = addressStr
            self.email = emailStr
            self.password = passwordStr
            self.profileImage = profileImg
            self.phone = phoneInt
            
}
}
}
