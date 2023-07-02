//
//  OffersViewModelTests.swift
//  IbottaAppTests
//
//  Created by Edgar Barocio on 7/2/23.
//

import XCTest
@testable import IbottaApp

final class OffersViewModelTests: XCTestCase {

    var sut:OffersViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = OffersViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testParseJson_ShouldReturnValidArray() throws {
        let testOffers = sut?.fetchOffersData()
        
        XCTAssertNotNil(testOffers, "Offers should not be nil")
        XCTAssertEqual(testOffers?.count, 3, "Offer count should match with local file")
    }
    
    func testBuildCollectionView_ShouldreturnCollectionView() throws {
        let testCollectionView = sut?.buildCollectionView()
        
        XCTAssertNotNil(testCollectionView, "Returned CollectionView should not be nil")
    }
}
