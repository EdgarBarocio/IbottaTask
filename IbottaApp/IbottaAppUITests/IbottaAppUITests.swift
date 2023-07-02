//
//  IbottaAppUITests.swift
//  IbottaAppUITests
//
//  Created by Edgar Barocio on 6/28/23.
//

import XCTest

final class IbottaAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Tap on second cell
        let cellsQuery = app.collectionViews.cells
        let scotchBriteScrubDotsHeavyDutyScrubSpongesElement = cellsQuery.otherElements.containing(.staticText, identifier:"Scotch-Brite® Scrub Dots Heavy Duty Scrub Sponges").element
        XCTAssertNotNil(scotchBriteScrubDotsHeavyDutyScrubSpongesElement, "Cell should not be nil")
        scotchBriteScrubDotsHeavyDutyScrubSpongesElement.tap()
        
        let favoriteButton = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).element
        
        //save favorite
        XCTAssertNotNil(favoriteButton, "Favorites indicator should exist")
        favoriteButton.tap()
        
        // Return to offers
        let latestOffersButton = app.navigationBars["IbottaApp.OfferDetailsView"].buttons["Latest offers!"]
        XCTAssertNotNil(latestOffersButton, "Back button should exist")
        latestOffersButton.tap()
        
        // Tap on same cell again, remove favorite and return to offers
        scotchBriteScrubDotsHeavyDutyScrubSpongesElement.tap()
        favoriteButton.tap()
        latestOffersButton.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
