//
//  OfferDetailsViewModelTests.swift
//  IbottaAppTests
//
//  Created by Edgar Barocio on 7/2/23.
//

import XCTest
@testable import IbottaApp

final class OfferDetailsViewModelTests: XCTestCase {

    var sut: OfferDetailsViewModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = OfferDetailsViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testOfferDetailsViewModel_ValuesShouldMatch() throws {
        
        sut = OfferDetailsViewModel(offerID: "Id",
                                    offerName: "Name",
                                    offerValue: "Value",
                                    offerDetals: "Details",
                                    offerTerms: "Terms",
                                    offerURL: "URL",
                                    favorite: false)
        
        XCTAssertNotNil(sut?.offerID, "Id Should not be nil")
        XCTAssertNotNil(sut?.offerURL, "Url Should not be nil")
        XCTAssertNotNil(sut?.offerName, "Name Should not be nil")
        XCTAssertNotNil(sut?.offerDetails, "Description Should not be nil")
        XCTAssertNotNil(sut?.offerTerms, "Terms Should not be nil")
        XCTAssertNotNil(sut?.offerValue, "CurrentValue Should not be nil")
        if let boolValue = sut?.favorite {
            XCTAssertFalse(boolValue, "isFavorite should default to False")
        } else {
            XCTFail("isFavorite should have a value")
        }
    }
}
