//
//  OffersColletionViewCell.swift
//  IbottaAppTests
//
//  Created by Edgar Barocio on 7/2/23.
//

import XCTest
@testable import IbottaApp

final class OffersColletionViewTestsCell: XCTestCase {

    var sut: OfferCollectionViewCell?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = OfferCollectionViewCell()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testOffersCollectionView_configurationShouldMatchDefaultUI() throws {
        let mockViewModel = OffersCollectionViewCellViewModel(url: "testURL",
                                                              name: "testName",
                                                              value: "testValue",
                                                              isFavorite: false)
        sut?.configure(mockViewModel)
        
        XCTAssertNotNil(sut, "OfferCollectionViewCell should not be nil")
        if let boolValue = sut?.favoritedView.isHidden {
            XCTAssertTrue(boolValue, "Favorite Should be Hidden")
        } else {
            XCTFail()
        }
    }
    
    func testOffersCollectionView_configurationShouldUpdateUI() throws {
        let mockViewModel = OffersCollectionViewCellViewModel(url: "testURL",
                                                              name: "testName",
                                                              value: "testValue",
                                                              isFavorite: true)
        sut?.configure(mockViewModel)
        
        XCTAssertNotNil(sut, "OfferCollectionViewCell should not be nil")
        
        if let boolValue = sut?.favoritedView.isHidden {
            XCTAssertFalse(boolValue, "Favorite Should be Shown")
        } else {
            XCTFail()
        }
    }
}
