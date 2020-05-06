//
//  ResultViewController.swift
//  HuriganaRubyApp
//
//  Created by user on 2020/05/03.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {


    @IBOutlet weak var resultTextLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func showResult(resultString: String) {
        resultTextLabel?.text = resultString
        print(resultString)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
