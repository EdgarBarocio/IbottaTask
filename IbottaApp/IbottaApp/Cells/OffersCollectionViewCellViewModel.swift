//
//  OffersCollectionViewCellViewModel.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 7/1/23.
//

import Foundation

/**
    View model for the OffersCollectionViewCell.
    Initializes itself with the partial content of the OffersModel, only for data display purposes
 */
struct OffersCollectionViewCellViewModel {
    var url: String?
    var name: String?
    var value: String?
    var isFavorite: Bool?
    
    init(url: String? = nil, name: String? = nil, value: String? = nil, isFavorite: Bool? = nil) {
        self.url = url
        self.name = name
        self.value = value
        self.isFavorite = isFavorite
    }
}
