//
//  RegistrationSecondViewController.swift
//  TaskUserLog
//
//  Created by Ikhram Khan on 12/7/19.
//  Copyright © 2019 IkhramDev. All rights reserved.
//

import UIKit

class RegistrationSecondViewController: UIViewController {

    @IBOutlet weak var datePickerTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
         alertView()
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
         loginAction()
    }

}

extension RegistrationSecondViewController {
    func alertView()  {
        let alert = UIAlertController(title: "", message: "Under Progress", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func loginAction()  {
        let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let customViewControllersArray : NSArray = [newViewController]
        self.navigationController?.viewControllers = customViewControllersArray as! [UIViewController]
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
 

