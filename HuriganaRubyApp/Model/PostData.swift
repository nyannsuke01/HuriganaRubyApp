//
//  PostData.swift
//  HuriganaRubyApp
//
//  Created by user on 2020/05/05.
//  Copyright © 2020 user. All rights reserved.
//

// ふりがな変換API Requestデータ
struct PostData: Codable {
    var app_id: String
    var request_id: String
    var sentence: String?
    var output_type: String
}
