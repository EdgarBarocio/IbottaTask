//
//  FavoriteUpdateProtocol.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 7/2/23.
//

import Foundation

/**
    Protocol for data transfer, takes the updated offer and send it to the protocol implementation
 - Parameters:
    - updatedOffer: OfferDetailsViewModel with the updated Favorite state.
 */
protocol FavoriteUpdateProtocol: AnyObject {
    func updateOfferState(updatedOffer: OfferDetailsViewModel)
}
