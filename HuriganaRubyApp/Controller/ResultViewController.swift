//
//  ResultViewController.swift
//  HuriganaRubyApp
//
//  Created by user on 2020/05/03.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultTextView: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        resultTextView.text = ""
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
