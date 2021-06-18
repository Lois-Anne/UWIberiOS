//
//  LoginViewController.swift
//  UWIber
//
//  Created by Shanis Cato on 6/18/21.
//

import Foundation
import UIKit
import Alamofire


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginDidTap(_ sender: Any) {
        var token = ""
        var id = ""
        if usernameField.text == nil && passwordField.text == nil {

        } else {
            let credentials = ["username": usernameField.text, "password": passwordField.text]
            let loginRequest = AF.request(LOGIN_URL, method: .post, parameters: credentials)
            loginRequest.responseDecodable(of: LoginResponse.self) { response in
                guard let loginResponse = response.value else {
                    return
                }
                print(loginResponse)
                token = loginResponse.token
                id = String(loginResponse.id)
            }


            let homeViewController = self.storyboard?.instantiateViewController(identifier: Constant.Storyboard.homeViewController) as? ViewController
            self.view.window?.rootViewController = homeViewController
            self.view.window?.makeKeyAndVisible()
        }

        @IBAction func noAccountDidTap(_ sender: Any) {
            let regViewController = self.storyboard?.instantiateViewController(identifier: Constant.Storyboard.regViewController) as? RegisterViewController
            self.view.window?.rootViewController = regViewController
            self.view.window?.makeKeyAndVisible()
        }

    }
}


