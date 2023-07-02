//
//  OffersModel.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 6/28/23.
//

import Foundation

/**
    Model to translate the Offers.json file into displayable data.
 */
struct OffersModel: Codable {
    var id: String?
    var url: String?
    var name: String?
    var description: String?
    var terms: String?
    var currentValue: String?
    
    //Optional variable to track Favorites, this was not present on the original Offers.json file.
    var isFavorite: Bool? = false
    
    //Coding keys for the json file
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case name
        case description
        case terms
        case currentValue = "current_value"
    }
}
