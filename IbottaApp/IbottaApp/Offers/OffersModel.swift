//
//  OffersModel.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import Foundation

struct OffersModel: Codable {
    var id: String?
    var url: String?
    var name: String?
    var description: String?
    var terms: String?
    var currentValue: String?
    
    var isFavorite: Bool? = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case name
        case description
        case terms
        case currentValue = "current_value"
    }
}
