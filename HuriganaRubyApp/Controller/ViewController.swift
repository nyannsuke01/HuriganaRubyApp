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
    @IBOutlet weak var convertButton: UIButton!
    // APIRequestの初期化
    var apiRequest = APIRequest()

    override func viewDidLoad() {
        super.viewDidLoad()

        inputTextView.delegate = self
        initInputText()

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

        if let imputWord = inputTextView.text{
            print("変換前　:" + imputWord)
        }
        return true
    }

    @IBAction func convertButton(_ sender: UIButton) {
        //キーボードを閉じる
        view.endEditing(true)

        if inputTextView.text == "" {
            //UIButtonを無効化
            convertButton.isEnabled = false
        }
        apiRequest.HttpRequest(sentence: inputTextView.text!)

    }

}
