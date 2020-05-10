//
//  ResultViewController.swift
//  HuriganaRubyApp
//
//  Created by user on 2020/05/03.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UITextFieldDelegate {
    // 前の画面から渡される変数
    var result: String!

    @IBOutlet weak var resultTextView: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultTextView.delegate = self
        showResult(resultString: result)
    }

    func showResult(resultString: String) {
        resultTextView?.text = resultString
        print(resultString)
    }
}
