//
//  APIRequest.swift
//  HuriganaRubyApp
//
//  Created by user on 2020/05/05.
//  Copyright © 2020 user. All rights reserved.
//

import Alamofire
import SwiftyJSON


public class APIRequest {

    func HttpRequest(sentence: String, completion: @escaping (String) -> Void ) {
        let url = URL(string: "https://labs.goo.ne.jp/api/hiragana")!
        let parameters = ["app_id":"e987ad7dfd648088566a4480d57a7a96816e3f36dfed860c37f958fb7d95da4e",
                          "sentence":"\(sentence)",
                          "output_type":"hiragana"]

        // Alamofireを使ってAPIリクエスト
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in

            switch response.result {
            // 処理成功時
            case .success(let data):
                if let result = data as? [String: Any] {
                    //SwiftyJSONを使用してJSON解析
                    let json = JSON(result as Any)
                    let resultString = json["converted"].string

                    if let resultString = resultString {
                        // クロージャで渡された処理がメインキューで行うべき処理かもしれないので、メインキューで処理する
                        DispatchQueue.main.async {
                            // クロージャの処理
                            completion(resultString)
                        }
                    }
                }
            // 処理失敗時
            case .failure(let error):
                print("error: ", error.localizedDescription)
            }
        }
    }
}
