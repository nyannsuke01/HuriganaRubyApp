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

        //if let inputTextView = inputTextView.text {
            apiRequest.HttpRequest(sentence: inputTextView.text!)



    }
    // ふりがな変換後テキストを出力
    func showRubi(resultString: String) {
        //くるくる消える
        //SVProgressHUD.dismiss()
        //outputTextのテキストフィールドに変換されてきた文字列を入れる
        outputTextView?.text = resultString
    }
    // ModalViewに値を渡す
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       // let modalVC = segue.destination as! ModalViewController
       // modalVC.result = hiraganaSentence

    }

    // エラーを出力
    func showError() {
        //outputTextのテキストフィールドに空欄を入れる
        outputTextView.text = ""
        //UIAlertControllerのshowAlertメソッドを実行（引数にメッセージを入れる）
//         UIAlertController.showAlert(viewController: self,
//                                    title: "",
//                                    message: errorMessage,
//                                    buttonTitle: Message.Button.OK,
//                                    buttonAction: nil)
    }

}
