//
//  DetailsViewModel.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 7/1/23.
//

import Foundation

class OfferDetailsViewModel {
    var offerID: String?
    var offerName: String?
    var offerValue: String?
    var offerDetails: String?
    var offerTerms: String?
    var offerURL: String?
    var favorite: Bool?
    
    weak var delegate: (FavoriteUpdateProtocol)?
    
    init(offerID: String? = nil, offerName: String? = nil, offerValue: String? = nil, offerDetals: String? = nil, offerTerms: String? = nil, offerURL: String? = nil, favorite: Bool? = nil) {
        self.offerID = offerID
        self.offerName = offerName
        self.offerValue = offerValue
        self.offerDetails = offerDetals
        self.offerTerms = offerTerms
        self.offerURL = offerURL
        self.favorite = favorite
    }
    
    func updateOfferState(model: OfferDetailsViewModel) {
        delegate?.updateOfferState(updatedOffer: model)
    }
}
