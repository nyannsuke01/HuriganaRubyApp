//
//  APIRequest.swift
//  HuriganaRubyApp
//
//  Created by user on 2020/05/05.
//  Copyright © 2020 user. All rights reserved.
//

import Alamofire
import SwiftyJSON

// ViewControllerの初期化
var VC = ViewController()
var ResultVC = ResultViewController()

public class APIRequest {

      func HttpRequest(sentence: String) {
        let url = GooAPI.Request.URL

            let parameters:[String: Any] = [
                "app_id": GooAPI.APP_ID,
                "request_id": GooAPI.Request.REQUEST_ID,
                "sentence": sentence,
                "output_type": GooAPI.Request.OUTPUT_TYPE
                ]

            Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
                switch response.result {
                    // 処理成功時
                    case .success:
                            if let result = response.result.value as? [String: Any] {
                            //SwiftyJSONを使用してJSON解析
                                let json:JSON = JSON(response.data as Any)
                                var resultString = json["converted"].string
                                ResultVC.showResult(resultString: resultString!)
                            }
                    // 処理失敗時
                    case .failure(let error):
                    // エラーメッセージの表示等
                    print(error)
                
                }
            }
        }

    
}
