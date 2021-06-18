//
//  LoginViewController.swift
//  UWIber
//
//  Created by Shanis Cato on 6/18/21.
//

import Foundation
import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func loginDidTap(_ sender: Any) {
        let tabController = self.storyboard?.instantiateViewController(withIdentifier: "tabC")
        self.view.window?.rootViewController = tabController
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func noAccountDidTap(_ sender: Any) {
        let regViewController = self.storyboard?.instantiateViewController(identifier: Constant.Storyboard.regViewController) as? RegisterViewController
        self.view.window?.rootViewController = regViewController
        self.view.window?.makeKeyAndVisible()
    }
    
}


