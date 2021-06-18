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
        if usernameField.text == nil && passwordField.text == nil {

        } else {
            var token = ""
            var userId = ""
            let credentials = ["username": usernameField.text, "password": passwordField.text]
            let loginRequest = AF.request(LOGIN_URL, method: .post, parameters: credentials)
            loginRequest.responseDecodable(of: LoginResponse.self) { response in
                guard let loginResponse = response.value else { return }
                print(loginResponse)
                token = loginResponse.token
                userId = String(loginResponse.id)
                UserDefaults.standard.set(token, forKey: "TOKEN")
                UserDefaults.standard.set(userId, forKey: "ID")
                let tabController = self.storyboard?.instantiateViewController(withIdentifier: "tabC")
                let headers: HTTPHeaders = [
                    "Authorization": "token \(token)"]

                let userInfoRequest = AF.request("\(BASE_USER_URL)/\(userId)/", headers: headers)
                userInfoRequest.responseDecodable(of: User.self) {response in
                    guard let user = response.value else { return }
                    print(user)
                }
                self.view.window?.rootViewController = tabController
                self.view.window?.makeKeyAndVisible()
            }
        }

    }
    
    @IBAction func noAccountDidTap(_ sender: Any) {
        let regViewController = self.storyboard?.instantiateViewController(identifier: Constant.Storyboard.regViewController) as? RegisterViewController
        self.view.window?.rootViewController = regViewController
        self.view.window?.makeKeyAndVisible()
    }
    
}


