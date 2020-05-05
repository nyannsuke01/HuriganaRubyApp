//
//  ViewController.swift
//  HuriganaRubyApp
//
//  Created by user on 2020/05/02.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var inputTextView: UITextField!
    @IBOutlet weak var outputTextView: UITextField!
    // APIRequestの初期化
    var apiRequest = APIRequest()

    override func viewDidLoad() {
        super.viewDidLoad()

        inputTextView.delegate = self
        outputTextView.delegate = self

       
        initInputText()
       // HttpRequest()
      // getArticles()

    }


    private func initInputText() {
        inputTextView.text = ""
    }

    //タッチでキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    //エンターでキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

    @IBAction func convertButton(_ sender: UIButton) {
        apiRequest.HttpRequest(sentence: inputTextView.text!)
        //presenterのconvertToRubiを入力した文字列を引数にして実行

    }


}
