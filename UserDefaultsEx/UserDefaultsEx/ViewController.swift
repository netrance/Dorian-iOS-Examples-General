//
//  ViewController.swift
//  UserDefaultsEx
//
//  Created by Dorian Lee on 2020/JUN/17.
//  Copyright © 2020 Dorian Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tfAccount: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        tfAccount.text = UserDefaults.standard.string(forKey: "account")
    }

    @IBAction func tfAccountEditingChanged(_ sender: UITextField) {
        UserDefaults.standard.set(sender.text, forKey: "account")
    }

}

