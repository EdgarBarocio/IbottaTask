//
//  FavoriteUpdateProtocol.swift
//  IbottaApp
//
//  Created by Edgar Barocio on 7/2/23.
//

import Foundation

protocol FavoriteUpdateProtocol: AnyObject {
    func updateOfferState(updatedOffer: OfferDetailsViewModel)
}
