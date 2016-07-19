//
//  ViewController.swift
//  Git Demo
//
//  Created by Rickey Hrabowskie on 7/15/16.
//  Copyright © 2016 Rickey Hrabowskie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonTapped(_ sender: AnyObject) {
        print("button tapped!")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Hello World!")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

