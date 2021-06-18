//
//  APIManager.swift
//  UWIber
//
//  Created by Software Engineering on 15/06/2021.
//

import Foundation
import Alamofire

class APIManager{
    static let shareInstance = APIManager()
    
    
    func callRegisterAPI(register: RegisterModel){
        let headers: HTTPHeaders = [
        .contentType("application/json")
        ]
        AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response{
            response in debugPrint(response)
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                }
                catch{}
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
    }
}
