//
//  ExampleViewModelSpec.swift
//  TestAsyncCodeExampleTests
//
//  Created by Yiyin Shen on 21/5/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import TestAsyncCodeExample

class ExampleViewModelSpec: QuickSpec {
    override func spec() {
        describe("ExampleViewModelSpec") {
            context("after fetching book list") {
                let viewModel = ExampleViewModel()
                viewModel.fetchBookList(completionHandler: { (_) in
                })

                it("should return correct book for index 0") {
                    expect(viewModel.book(at: 0)).toEventually(equal("Body & Soul"))
                }

                it("should return correct number of books") {
                    expect(viewModel.numberOfBooks).toEventually(equal(10))
                }
            }
        }
    }
}
