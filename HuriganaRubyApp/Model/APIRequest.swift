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

      func HttpRequest(sentence: String) {
            let url = "https://labs.goo.ne.jp/api/hiragana"

            let parameters:[String: Any] = [
                "app_id": GooAPI.APP_ID,
                "request_id": "",
                "sentence": sentence,
                "output_type": "hiragana"
                ]

            Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
                    // 処理成功時
                    case .success:
                            if let result = response.result.value as? [String: Any] {
                                print(result)
                            //SwiftyJSONを使用してJSON解析
                                let json:JSON = JSON(response.data as Any)
                                var resultString = json["result"][0].string

                }
                    // 処理失敗時
                    case .failure(let error):
                        // エラーメッセージの表示等
                    print(error)
                }
            }
        }
    
}
