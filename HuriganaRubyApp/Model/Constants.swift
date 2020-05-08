//
//  Constants.swift
//  HuriganaRubyApp
//
//  Created by user on 2020/05/03.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

struct GooAPI {
    static let APP_ID = "e987ad7dfd648088566a4480d57a7a96816e3f36dfed860c37f958fb7d95da4e"

    struct Request {
        static let URL = "https://labs.goo.ne.jp/api/hiragana"
        static let REQUEST_ID = ""
        static let OUTPUT_TYPE = "hiragana"
    }
}

struct HeaderField {
    static let CONTENT_TYPE =  "Content-Type"
    static let JSON =  "application/json"
}

struct Message {
    struct Error {
        static let NO_INPUT_TEXT = "文字が入力されていません"
        static let CANT_CONNECT_SERVER = "サーバーに接続できません"
        static let NO_RESPONSE_DATA = "結果がありません"
        static let FAILED_JSON_PARSE = "JSONのパースに失敗しました"
    }

    struct Button {
        static let OK = "OK"
    }
}
