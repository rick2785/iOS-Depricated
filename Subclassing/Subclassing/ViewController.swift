//
//  ViewController.swift
//  Subclassing
//
//  Created by Rickey Hrabowskie on 7/18/16.
//  Copyright © 2016 Rickey Hrabowskie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var specialImageView1: SpecialImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        specialImageView1.borderColor = UIColor.blueColor().CGColor
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

