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

        // MARK: 変更
        // 関数の引数としてクロージャを取るように設定し、クロージャ内部で目的とするビューに表示させる
        // クロージャは completion: の後に引数として取る
        //    func HttpRequest(sentence: String) {
        func HttpRequest(sentence: String, completion: @escaping (String) -> Void ) {
            let url = URL(string: "https://labs.goo.ne.jp/api/hiragana")!
            let parameters = ["app_id":"GooAPI.APP_ID",
                              "sentence":"\(sentence)",
                              "output_type":"GooAPI.OUTPUT_TYPE"]
            // Alamofireを使ってAPI通信
            Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in

                switch response.result {
                // 処理成功時
                case .success(let data):
                    if let result = data as? [String: Any] {
                        //SwiftyJSONを使用してJSON解析
                        let json = JSON(result as Any)
                        let resultString = json["converted"].string
                        // その他諸々の問題があるので、インスタンス化する方法はクロージャで渡された処理に任せる
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
