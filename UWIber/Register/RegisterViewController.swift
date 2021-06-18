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
        let parameters = [
            "is_client": "True",
            "username": username,
            "email": email,
            "first_name": fName,
            "last_name": lName,
            "password": password,
            "Client": [
                "user": username,
                "gender": "F",
                "date_of_birth": DateFormatter().string(from: dobPicker.date),
                "phone_number": phoneNumText,
                "address": "Town"
            ]
        ] as [String: Any]
//        let registerer = NewUser(
//                isClient: true, username: username, email: email, firstName: fName, lastName: lName, password: password,
//                client: Client(user: username, dateOfBirth: DateFormatter().string(from: dobPicker.date), gender: "F", phoneNumber: phoneNum, address: ""))
        let registerRequest = AF.request(REGISTER_URL, method: .post, parameters: parameters)


        registerRequest.responseDecodable(of: NewUser.self) { response in
            guard let registerResponse = response.value else { return }
            print(registerResponse)

        }
        
        
    }
   

}
