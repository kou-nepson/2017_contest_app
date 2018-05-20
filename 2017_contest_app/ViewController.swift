//
//  ViewController.swift
//  2017_contest_app
//
//  Created by 杉山航 on 2017/08/05.
//  Copyright © 2017年 杉山航. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController , UITextFieldDelegate {
    
    private let ref = Database.database().reference().child("idList")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

