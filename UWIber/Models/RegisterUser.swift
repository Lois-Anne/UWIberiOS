import Foundation
import Alamofire

// MARK: - RegisterUser
struct RegisterUser: Decodable {
    let isClient, username, email, firstName: String
    let lastName, password: String
    let client: Client

    enum CodingKeys: String, CodingKey {
        case isClient = "is_client"
        case username, email
        case firstName = "first_name"
        case lastName = "last_name"
        case password, client
    }
}