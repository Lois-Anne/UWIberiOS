//
//  RegisterViewController.swift
//  UWIber
//
//  Created by Software Engineering on 15/06/2021.
//

import Foundation
import UIKit
import Alamofire

class RegisterViewController: UIViewController{
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var lNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var phoneNumText: UITextField!
    @IBOutlet weak var dobPicker: UIDatePicker!
    @IBOutlet weak var fNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    
    }
    
}
extension RegisterViewController{
    @IBAction func signupBtnClick(_ sender: UIButton) {
        guard let username = self.usernameText.text else { return }
        guard let fName = self.fNameText.text else { return }
        guard let lName = self.lNameText.text else { return }
        guard let password = self.usernameText.text else { return }
        guard let email = self.emailText.text else { return }
        guard let phoneNumText = self.phoneNumText.text else { return }
        guard let phoneNum = Int(phoneNumText) else { return }
        
//        guard let date = self.dobPicker. else { return }
        
        let register = RegisterModel(name: username, email: email, password: password, firstName: fName, lastName: lName, username: username)
        let client = ClientModel(username: username, date_of_birth: "", phone_number: phoneNum)

        let request = AF.request(REGISTER_URL, method: .post)
//        request.responseDecodable(of: RegisterUser)
        APIManager.shareInstance.callRegisterAPI(register: register)
        
        
    }
   

}
