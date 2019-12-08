//
//  LoginViewController.swift
//  TaskUserLog
//
//  Created by Ikhram Khan on 12/7/19.
//  Copyright © 2019 IkhramDev. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    let defaults = UserDefaults.standard
    let viewModel = LoginViewModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let loggedInStr = defaults.value(forKey: "email") as? String
        if  loggedInStr != nil {
            pushToHome()
        } else {
        viewModel.parseJsonForUserList()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        emailIdTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
       loginAction()
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
       pushToSignUp()
    }

}

extension LoginViewController {
    func pushToHome()  {
         let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
                   self.navigationController?.pushViewController(vc, animated: true)
    }
    func pushToSignUp()  {
         let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
                self.navigationController?.pushViewController(vc, animated: true)
    }
    func loginAction()  {
        if emailIdTextField.text?.isEmpty ?? false || passwordTextField.text?.isEmpty ?? false {
            alertView(str: AppConstants.LoginEmptyMsg)
        } else if emailIdTextField.text?.isEmail ?? false && !(passwordTextField.text?.isEmpty ?? false) {
            if viewModel.isUserValid(emailId: emailIdTextField.text ?? "", passWord: passwordTextField.text ?? "") {
            defaults.setValue(emailIdTextField.text, forKey: "email")
            defaults.synchronize()
              pushToHome()
            } else {
              alertView(str: AppConstants.LoginInvalidMsg)
            }
        } else {
            alertView(str: AppConstants.LoginInvalidMsg)
        }
    }
    func alertView(str:String)  {
             let alert = UIAlertController(title: "", message: str, preferredStyle: UIAlertController.Style.alert)
             alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
             self.present(alert, animated: true, completion: nil)
         }
}
