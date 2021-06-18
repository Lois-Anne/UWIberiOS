// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct User: Decodable {
    let id: Int
    let firstName, lastName, email: String
    let client: Client

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email, client
    }
}

// MARK: - Client
struct Client: Codable {
    let user, dateOfBirth, gender: String
    let phoneNumber: Int
    let address: String

    enum CodingKeys: String, CodingKey {
        case user
        case dateOfBirth = "date_of_birth"
        case gender
        case phoneNumber = "phone_number"
        case address
    }
}

// MARK: - RideSet
struct RideSet: Codable {
    let price: Int
    let time: String
    let numPassengers: Int
    let dateCreated, rideType: String
    let startLocation, endLocation, client, driver: Int
    let vehicle: Int

    enum CodingKeys: String, CodingKey {
        case price, time, numPassengers
        case dateCreated = "date_created"
        case rideType = "ride_type"
        case startLocation = "start_location"
        case endLocation = "end_location"
        case client, driver, vehicle
    }
}
