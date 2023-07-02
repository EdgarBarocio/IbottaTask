//
//  OfferDetailsViewTests.swift
//  IbottaAppTests
//
//  Created by Edgar Barocio on 7/2/23.
//

import XCTest
@testable import IbottaApp

final class OfferDetailsViewTests: XCTestCase {

    var sut: OfferDetailsView?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = OfferDetailsView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testOfferDetailsView_ShouldUpdateFavoriteAndModel() throws {
        let mockObject = OfferDetailsViewModel(offerID: "Id",
                                               offerName: "Name",
                                               offerValue: "Value",
                                               offerDetals: "Details",
                                               offerTerms: "Terms",
                                               offerURL: "URL",
                                               favorite: false)
        
        sut?.updateInformation(mockObject)
        XCTAssertEqual(sut?.favoriteToggle.backgroundColor, .lightGray, "Favorite Should Be Disabled")
        sut?.favoritePressed()
        XCTAssertEqual(sut?.favoriteToggle.backgroundColor, .green, "Favorite Should Be Activated")
        if let boolValue = sut?.model?.favorite {
            XCTAssertTrue(boolValue, "ViewModel should have been updated with the button press")
        } else {
            XCTFail()
        }
        
    }
}
