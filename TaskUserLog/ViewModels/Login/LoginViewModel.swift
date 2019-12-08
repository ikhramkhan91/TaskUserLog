//
//  LoginViewModel.swift
//  TaskUserLog
//
//  Created by Ikhram Khan on 12/8/19.
//  Copyright © 2019 IkhramDev. All rights reserved.
//

import Foundation

class LoginViewModel {
    
 
        var userList = [UserListModel.UserListDetails]()
        
        func parseJsonForUserList()  {
            //Now lets populate our TableView
            let newUrl = Bundle.main.url(forResource: "UsersList", withExtension: "json")
            
            guard let jsonData = newUrl
                     else{
                         print("data not found")
                         return
                 }
                 
            guard let data = try? Data(contentsOf: jsonData) else { return }
             
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else{return}
            
            
            if let JSON = json as? [String: Any] {
                guard let jsonArray = JSON["userlists"] as? [[String: Any]] else {
                    return
                }
                print(jsonArray)
                userList = jsonArray.compactMap{return UserListModel.UserListDetails($0)}
            }
        }
   

    
    func isUserValid(emailId:String,passWord:String) -> Bool {
        
        if let _ = userListArray().firstIndex(where: { (($0.email == emailId) && ($0.password == passWord)) }) {
        return true
               }
        return false
    }
    
    
}


extension LoginViewModel {
    func userListArray() -> [UserListModel.UserListDetails] {
     return userList
    }
}
