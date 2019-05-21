//
//  ExampleViewModelTests.swift
//  TestAsyncCodeExampleTests
//
//  Created by Yiyin Shen on 21/5/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation
import XCTest
@testable import TestAsyncCodeExample

class ExampleViewModelTests: XCTestCase {

    // failing test
    func testExampleViewModel() {
        let viewModel = ExampleViewModel()
        viewModel.fetchBookList { (bookList) in
            XCTAssertEqual(bookList.count, 10)
        }

        XCTAssertEqual(viewModel.book(at: 0), "Body & Soul")
        XCTAssertEqual(viewModel.numberOfBooks, 10)
    }

    // succeeding test: asyncExpectation.fulfill()
    func testExampleViewModelAsync() {
        let asyncExpectation = expectation(description: "fetch book list")
        let viewModel = ExampleViewModel()
        viewModel.fetchBookList { (bookList) in
            asyncExpectation.fulfill()
        }

        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertEqual(viewModel.book(at: 0), "Body & Soul")
        XCTAssertEqual(viewModel.numberOfBooks, 10)
    }
}
