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

        return true
    }

    @IBAction func convertButton(_ sender: UIButton) {
        view.endEditing(true)

        apiRequest.HttpRequest(sentence: inputTextView.text!, completion: {
            result in

            // segue を使う遷移
            self.performSegue(withIdentifier: "nextSegue", sender: result)

        })
    }

    // segue を使って値渡しする場合
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 遷移先が ResultViewController の場合
        if let nextVC = segue.destination as? ResultViewController {
            // sender が　String としてダウンキャストできる場合
            if let result = sender as? String {
                // 遷移先のプロパティに値をセットする
                nextVC.result = result
            }
        }
    }
}
