//
//  automationDemoUITests.swift
//  automationDemoUITests
//
//  Created by Bharathram C on 19/04/16.
//  Free to modified and distributed   
//

import XCTest
import Foundation
import UIKit

class automationDemoUITests: XCTestCase {
        
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
    

    func test_001_AddFunction()
    {
        
        let app = XCUIApplication()
        let value1textfieldTextField = app.textFields.element(boundBy: 0)
        let value2textfieldTextField = app.textFields.element(boundBy: 2)
        let inputValues1 = ["1","2","3"]
        let inputValues2 = ["4","5","6"]
        let resultValues = ["5.0","7.0","9.0"]
        
        for i in 0 ..< inputValues1.count
        {
            value1textfieldTextField.tap()
            value1textfieldTextField.typeText(inputValues1[i])
            value2textfieldTextField.tap()
            value2textfieldTextField.typeText(inputValues2[i])
            app.buttons["addButton"].tap()
            XCTAssertEqual(app.textFields["resultField"].value as? String, resultValues[i],
                "Addtion value incorrect")
        }
    }
    
    func test_002_SubFunction()
    {
        
        let app = XCUIApplication()
        let value1textfieldTextField = app.textFields["Value1TextField"]
        value1textfieldTextField.tap()
        value1textfieldTextField.typeText("2")
        
        let value2textfieldTextField = app.textFields["Value2TextField"]
        value2textfieldTextField.tap()
        value2textfieldTextField.typeText("3")
        app.buttons["subButton"].tap()
        app.textFields["resultField"].tap()
        XCTAssertEqual(app.textFields["resultField"].value as? String, "-1.0",
            "Addtion value incorrect")
    }
    
    func test_003_ProductFunction()
    {
        
        let app = XCUIApplication()
        let value1textfieldTextField = app.textFields["Value1TextField"]
        value1textfieldTextField.tap()
        value1textfieldTextField.typeText("2")
        
        let value2textfieldTextField = app.textFields["Value2TextField"]
        value2textfieldTextField.tap()
        value2textfieldTextField.typeText("3")
        app.buttons["prodButton"].tap()
        app.textFields["resultField"].tap()
        XCTAssertEqual(app.textFields["resultField"].value as? String, "6.0",
            "Addtion value incorrect")
    }
    
    func test_004_DivisionFunction()
    {
        
        let app = XCUIApplication()
        let value1textfieldTextField = app.textFields["Value1TextField"]
        value1textfieldTextField.tap()
        value1textfieldTextField.typeText("3")
        
        let value2textfieldTextField = app.textFields["Value2TextField"]
        value2textfieldTextField.tap()
        value2textfieldTextField.typeText("2")
        app.buttons["divButton"].tap()
        app.textFields["resultField"].tap()
        XCTAssertEqual(app.textFields["resultField"].value as? String, "1.5",
            "Addtion value incorrect")
    }
    
    func testPerformSwipe()
    {
        
        let sampleCalcAppElement = XCUIApplication().otherElements.containing(.staticText, identifier:"Sample Calc App").element
        sampleCalcAppElement.swipeLeft()
        Thread.sleep(forTimeInterval: 3)
        sampleCalcAppElement.swipeRight()
        Thread.sleep(forTimeInterval: 3)
    }
    
    
}
