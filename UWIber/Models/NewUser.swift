// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let registerCall = try? newJSONDecoder().decode(RegisterCall.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseRegisterCall { response in
//     if let registerCall = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - RegisterCall
struct NewUser: Codable {
    let isClient: Bool
    let username, email, firstName: String
    let lastName, password: String
    let client: Client

    enum CodingKeys: String, CodingKey {
        case isClient
        case username, email
        case firstName
        case lastName
        case password, client
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseClient { response in
//     if let client = response.result.value {
//       ...
//     }
//   }

