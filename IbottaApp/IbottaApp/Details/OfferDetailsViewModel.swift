//
//  DetailsViewModel.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 7/1/23.
//

import Foundation

/**
    OfferDetailsViewModel that displays the offers from the OffersModel array for the OfferDetailsView
 */
struct OfferDetailsViewModel {
    var offerID: String?
    var offerName: String?
    var offerValue: String?
    var offerDetails: String?
    var offerTerms: String?
    var offerURL: String?
    var favorite: Bool?
    
    // Delegate for the FavoriteUpdateProtocol
    weak var delegate: (FavoriteUpdateProtocol)?
    
    /**
        Initializer for the OfferDetailsViewModel, all parameters opcional
     */
    init(offerID: String? = nil, offerName: String? = nil, offerValue: String? = nil, offerDetals: String? = nil, offerTerms: String? = nil, offerURL: String? = nil, favorite: Bool? = nil) {
        self.offerID = offerID
        self.offerName = offerName
        self.offerValue = offerValue
        self.offerDetails = offerDetals
        self.offerTerms = offerTerms
        self.offerURL = offerURL
        self.favorite = favorite
    }
    
    /**
        Function that calls the updateOffersState protocol for all classes that set themself as the view model delegate.
     
     - Parameters:
        - model: OfferDetailsViewModel with the updated favorite parameter
     */
    func updateOfferState(model: OfferDetailsViewModel) {
        delegate?.updateOfferState(updatedOffer: model)
    }
}
