//
//  ViewController.swift
//  HuriganaRubyApp
//
//  Created by user on 2020/05/02.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var inputTextView: UITextField!
    @IBOutlet weak var outputTextView: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        initInputText()
       // HttpRequest()
      // getArticles()

    }
    private func initInputText() {
        inputTextView.text = ""
    }

    @IBAction func convertButton(_ sender: UIButton) {
        HttpRequest()
    }

    func HttpRequest() {
        let url = "https://labs.goo.ne.jp/api/hiragana"
        let headers: HTTPHeaders = [
            "Contenttype": "application/json"
        ]
        let parameters:[String: Any] = [
            "app_id": String.self,
            "request_id": String.self,
             "sentence": String.self,
             "output_type": String.self
            ]

        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if let result = response.result.value as? [String: Any] {
                print(result)
            }
        }

    }









}
