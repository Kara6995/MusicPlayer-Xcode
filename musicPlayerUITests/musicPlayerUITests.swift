//
//  musicPlayerUITests.swift
//  musicPlayerUITests
//
//  Created by Rajkumar on 13/10/18.
//  Copyright © 2018 Rajkumar. All rights reserved.
//

import XCTest

class musicPlayerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Ant-Man and the Wasp"]/*[[".cells.staticTexts[\"Ant-Man and the Wasp\"]",".staticTexts[\"Ant-Man and the Wasp\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["musicPlayer.playView"].buttons["Back"].tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSearch() {
        
        let searchSongsSearchField = XCUIApplication()/*@START_MENU_TOKEN@*/.searchFields["Search Songs"]/*[[".otherElements[\"Search\"].searchFields[\"Search Songs\"]",".searchFields[\"Search Songs\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        searchSongsSearchField.tap()
        searchSongsSearchField.typeText("m")
        
        
    }

    
}
