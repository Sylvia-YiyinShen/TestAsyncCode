//
//  UITestsUtilities.swift
//  HomeTimeUITests
//
//  Created by ? on 6/1/19.
//  Copyright © 2019 REA. All rights reserved.
//

import Foundation
import XCTest

enum UITestTimeout: TimeInterval {
    case normal = 30
}

class UITestsUtilities {
    private weak var testCase: XCTestCase!
    private weak var app: XCUIApplication!

    public init(testCase: XCTestCase, app: XCUIApplication) {
        self.testCase = testCase
        self.app = app
    }

    func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = UITestTimeout.normal.rawValue, file: String = #file, line: UInt = #line, completion: XCWaitCompletionHandler? = nil, customErrorMessage: String? = nil) {
        let existsPredicate = NSPredicate(format: "exists == true")
        testCase.expectation(for: existsPredicate,
                             evaluatedWith: element, handler: nil)

        testCase.waitForExpectations(timeout: timeout) { (error) -> Void in
            if error != nil {
                let message = "Failed to find \(element) after \(timeout) seconds. \(customErrorMessage ?? "")"
                self.testCase.recordFailure(withDescription: message, inFile: file, atLine: Int(line), expected: true)
            }
            completion?(error)
        }
    }
}
