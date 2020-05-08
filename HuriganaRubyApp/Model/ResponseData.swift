//
//  ResponseData.swift
//  HuriganaRubyApp
//
//  Created by user on 2020/05/05.
//  Copyright © 2020 user. All rights reserved.
//

// ふりがな変換API Responseデータ
struct ResponseData: Codable {
    var request_id: String
    var output_type: String
    var converted: String
}
