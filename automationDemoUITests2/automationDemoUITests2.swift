//
//  automationDemoUITests2.swift
//  automationDemoUITests2
//
//  Created by Bharathram C on 15/03/17.
//  Free to modified and distributed

import XCTest

class automationDemoUITests2: XCTestCase {
    let app = XCUIApplication()
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
    
    func test_addFunction(){
        let textField1 = app.textFields["Value1TextField"]
        let textField2 = app.textFields["Value2TextField"]
        let resultField = app.textFields["resultField"]
        
        textField1.tap()
        textField1.typeText("5")
        
        textField2.tap()
        textField2.typeText("10.5")
        
        app.buttons["addButton"].tap()
        
        let result = app.textFields["resultField"].value as! String
        
        XCTAssertEqual(result, "15.5", "Addtion Function is not working as expected")
    }
    
    func test_subFunction(){
        let textField1 = app.textFields["Value1TextField"]
        let textField2 = app.textFields["Value2TextField"]
        let resultField = app.textFields["resultField"]
        
        textField1.tap()
        textField1.typeText("5")
        
        textField2.tap()
        textField2.typeText("10.5")
        
        app.buttons["subButton"].tap()
        
        let result = app.textFields["resultField"].value as! String
        
        XCTAssertEqual(result, "-5.5", "Addtion Function is not working as expected")
    }
    
    func testFetch(){
        
        let fetchNavButton = app.navigationBars.buttons["Fetch >"]
        let statusLabel = app.staticTexts["View is Now Active"]
        let fetchLabel = app.staticTexts["Press Fetch to Get data"]
        let fetchButton = app.buttons["Fetch"]
        let fetchingLuckyLabel = app.staticTexts["Fetching Lucky Numbers"]
        let luckyNumbersValue = app.staticTexts.element(boundBy: 2)
        
        fetchNavButton.tap()
        
        XCTAssertTrue(statusLabel.exists,"statusLabel not seen")
        XCTAssertTrue(fetchLabel.exists,"fetchLabel not seen")
        
        fetchButton.tap()
        
        XCTAssertFalse(statusLabel.exists,"statusLabel not seen")
        XCTAssertFalse(fetchLabel.exists,"statusLabel not seen")
        XCTAssertTrue(fetchingLuckyLabel.exists,"fetchingLuckyLabel not seen")
        
        sleep(6)
        
        XCTAssertTrue(statusLabel.exists,"statusLabel not seen")
    }
}
