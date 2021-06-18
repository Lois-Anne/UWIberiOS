//
// Created by Dientje Francis Lawrence on 6/17/21.
//

import Foundation

struct Locations: Decodable {
    let locations: [Location]
}

struct Location: Decodable {
    let id: Int
    let locationName: String
    let latitude, longitude: Double
}