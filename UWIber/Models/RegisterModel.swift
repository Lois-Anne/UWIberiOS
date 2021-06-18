//
//  RegisterModel.swift
//  UWIber
//
//  Created by Software Engineering on 15/06/2021.
//

import Foundation

struct RegisterModel: Encodable {
    let name: String
    let email: String
    let password: String
    let firstName: String
    let lastName: String
    let username: String
//    let date_of_birth: Date
//    let phone_number: Int
//    let address: String
}
struct ClientModel: Encodable {
    let username: String
    let date_of_birth: String
    let phone_number: Int}
