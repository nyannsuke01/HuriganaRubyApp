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
    var API: APIRequest!

    override func setUp() {
        VC = ViewController()
        ResultVC = ResultViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // 入力文字が空(エラー)
    func testInputEmptyConvertToRubi() {
        let sentence = ""
        let expectected = Message.Error.NO_INPUT_TEXT
        let exp: XCTestExpectation! = self.expectation(description: "testInputEmptyConvertToRubi")
        APIRequest.HttpRequest(sentence: sentence,
                                           success: { rubiResponseData in
                                            XCTFail("converted:" + rubiResponseData.converted)
                                            exp.fulfill()
        },
                                           failure: { errorText in
                                            XCTAssertEqual(expectected, errorText)
                                            exp.fulfill()

        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }

    // 入力文字が漢字
    func testInputKanjiConvertToRubi() {
        let sentence = "漢字"
        let expectected = "かんじ"
        let exp: XCTestExpectation! = self.expectation(description: "testInputKanjiConvertToRubi")
        APIRequest.HttpRequest(sentence: sentence,
                                           success: { rubiResponseData in
                                            XCTAssertEqual(expectected, rubiResponseData.converted)
                                            exp.fulfill()

        },
                                           failure: { errorText in
                                            XCTFail("errorText:" + errorText)
                                            exp.fulfill()

        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }

    // 入力文字がひらがな
    func testInputHiraganaConvertToRubi() {
        let sentence = "ひらがな"
        let expectected = "ひらがな"
        let exp: XCTestExpectation! = self.expectation(description: "testInputHiraganaConvertToRubi")
        APIRequest.HttpRequest(sentence: sentence,
                                           success: { rubiResponseData in
                                            XCTAssertEqual(expectected, rubiResponseData.converted)
                                            exp.fulfill()

        },
                                           failure: { errorText in
                                            XCTFail("errorText:" + errorText)
                                            exp.fulfill()

        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }

    // 入力文字が数字
    func testInputNumberConvertToRubi() {
        let sentence = "1230"
        let expectected = "せんにひゃくさんじゅう"
        let exp: XCTestExpectation! = self.expectation(description: "testInputNumberConvertToRubi")
        APIRequest.HttpRequest(sentence: sentence,
                                           success: { rubiResponseData in
                                            XCTAssertEqual(expectected, rubiResponseData.converted)
                                            exp.fulfill()

        },
                                           failure: { errorText in
                                            XCTFail("errorText:" + errorText)
                                            exp.fulfill()

        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }

    // 入力文字がローマ字
    func testInputRomanConvertToRubi() {
        let sentence = "abc"
        let expectected = "えーびーしー"
        let exp: XCTestExpectation! = self.expectation(description: "testInputRomanConvertToRubi")
        APIRequest.HttpRequest(sentence: sentence,
                                           success: { rubiResponseData in
                                            XCTAssertEqual(expectected, rubiResponseData.converted)
                                            exp.fulfill()

        },
                                           failure: { errorText in
                                            XCTFail("errorText:" + errorText)
                                            exp.fulfill()

        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }

    // 入力文字が記号
    func testInputSymbolConvertToRubi() {
        let sentence = "//(^_^);:"
        let expectected = "//(^_^);:"
        let exp: XCTestExpectation! = self.expectation(description: "testInputSymbolConvertToRubi")
        APIRequest.HttpRequest(sentence: sentence,
                                           success: { rubiResponseData in
                                            XCTAssertEqual(expectected, rubiResponseData.converted)
                                            exp.fulfill()
        },
                                           failure: { errorText in
                                            XCTFail("errorText:" + errorText)
                                            exp.fulfill()

        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
}

