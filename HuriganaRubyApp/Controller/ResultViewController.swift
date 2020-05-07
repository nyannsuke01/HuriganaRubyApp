//
//  ResultViewController.swift
//  HuriganaRubyApp
//
//  Created by user on 2020/05/03.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var resultTextView: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultTextView.delegate = self

    }


    func showResult(resultString: String) {
        resultTextView?.text = resultString
        print(resultString)
    }

}
