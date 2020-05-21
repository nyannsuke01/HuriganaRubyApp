//
//  HuriganaRubyAppTests.swift
//  HuriganaRubyAppTests
//
//  Created by user on 2020/05/02.
//  Copyright © 2020 user. All rights reserved.
//

import XCTest
@testable import HuriganaRubyApp

class HuriganaRubyTests: XCTestCase {
    var VC: ViewController!
    var ResultVC: ResultViewController!
    var apiRequest: APIRequest!

    override func setUp() {
        VC = ViewController()
        ResultVC = ResultViewController()
        apiRequest = APIRequest()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // 入力文字が漢字
    func testInputKanjiConvert() {
        let sentence = "漢字"
        let expectected = "かんじ"
        let exp: XCTestExpectation! = self.expectation(description: "testInputKanjiConvert")
        apiRequest.HttpRequest(sentence: sentence,
                                           completion:  { result, error in
                                            if result == nil {
                                                XCTFail()
                                                exp.fulfill()
                                            }

                                            XCTAssertNotNil(result)
                                            XCTAssertEqual(expectected, result)

                                            exp.fulfill()

        } )
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
/*
    // 入力文字がひらがな
    func testInputHiraganaConvert() {
        let sentence = "ひらがな"
        let expectected = "ひらがな"
        let exp: XCTestExpectation! = self.expectation(description: "testInputHiraganaConvert")
        APIRequest.HttpRequest(sentence: sentence,
                                           success: { ResponseData in
                                            XCTAssertEqual(expectected, ResponseData.converted)
                                            exp.fulfill()

        },
                                           failure: { errorText in
                                            XCTFail("errorText:" + errorText)
                                            exp.fulfill()

        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }

    // 入力文字が数字
    func testInputNumberConvert() {
        let sentence = "1230"
        let expectected = "せんにひゃくさんじゅー"
        let exp: XCTestExpectation! = self.expectation(description: "testInputNumberConvert")
        APIRequest.HttpRequest(sentence: sentence,
                                           success: { ResponseData in
                                            XCTAssertEqual(expectected, ResponseData.converted)
                                            exp.fulfill()

        },
                                           failure: { errorText in
                                            XCTFail("errorText:" + errorText)
                                            exp.fulfill()

        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }

    // 入力文字がローマ字
    func testInputRomanConvert() {
        let sentence = "abc"
        let expectected = "えーびーしー"
        let exp: XCTestExpectation! = self.expectation(description: "testInputRomanConvert")
        APIRequest.HttpRequest(sentence: sentence,
                                           success: { ResponseData in
                                            XCTAssertEqual(expectected, ResponseData.converted)
                                            exp.fulfill()

        },
                                           failure: { errorText in
                                            XCTFail("errorText:" + errorText)
                                            exp.fulfill()

        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }

    // 入力文字が記号
    func testInputSymbolConvert() {
        let sentence = "//(^_^);:"
        let expectected = "//(^_^);:"
        let exp: XCTestExpectation! = self.expectation(description: "testInputSymbolConvert")
        APIRequest.HttpRequest(sentence: sentence,
                                           success: { ResponseData in
                                            XCTAssertEqual(expectected, ResponseData.converted)
                                            exp.fulfill()
        },
                                           failure: { errorText in
                                            XCTFail("errorText:" + errorText)
                                            exp.fulfill()

        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
 */
}

