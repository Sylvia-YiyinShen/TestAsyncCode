//
//  ExampleViewModel.swift
//  TestAsyncCodeExample
//
//  Created by Yiyin Shen on 21/5/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation

class ExampleViewModel {
    private var bookList: [String] = []

    var numberOfBooks: Int {
        return bookList.count
    }

    func book(at index: Int) -> String? {
        guard bookList.indices.contains(index) else {
            return nil
        }
        return bookList[index]
    }

    func fetchBookList(completionHandler: @escaping ([String]) -> Void) {
        // mock an async function e.g API call
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            // mock data
            self.bookList = [
                "Body & Soul",
                "The Border",
                "The Bouncer",
                "The Feral Detective",
                "Give Me Your Hand",
                "The Infinite Blacktop",
                "November Road",
                "Red, White, Blue",
                "Transcription",
                "Unto Us a Son Is Given"
            ]

            completionHandler(self.bookList)
        }
    }
}


