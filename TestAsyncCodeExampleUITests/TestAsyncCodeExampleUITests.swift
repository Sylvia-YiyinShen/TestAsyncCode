//
//  TestAsyncCodeExampleUITests.swift
//  TestAsyncCodeExampleUITests
//
//  Created by Yiyin Shen on 21/5/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import XCTest

class TestAsyncCodeExampleUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    //failing test
    func testLabelPopulated1() {
        let application = XCUIApplication()
        let firstBookLabel = application.staticTexts["Body & Soul"]
        XCTAssert(firstBookLabel.exists)
    }

    // pass test via sleep()
    func testLabelPopulated2() {
        let application = XCUIApplication()
        sleep(3)
        let firstBookLabel = application.staticTexts["Body & Soul"]
        XCTAssert(firstBookLabel.exists)
    }

    // test asynchronously
    func testLabelPopulatedAsync() {
        let application = XCUIApplication()
        let utilities = UITestsUtilities(testCase: self, app: application)

        let firstBookLabel = application.staticTexts["Body & Soul"]
        utilities.waitForElementToAppear(element: firstBookLabel)
    }
}
