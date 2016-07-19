//
//  SpecialImageView.swift
//  Subclassing
//
//  Created by Rickey Hrabowskie on 7/18/16.
//  Copyright © 2016 Rickey Hrabowskie. All rights reserved.
//

import UIKit

class SpecialImageView: UIImageView {
    
    var borderColor:CGColor? {
        
        get {
            return self.layer.borderColor
        }
        
        set {
            self.layer.borderColor = newValue
            self.layer.borderWidth = 6
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SpecialImageView.jumpAround))
        self.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    func jumpAround() {
        
        UIView.animateWithDuration(0.5, animations: {
            self.transform = CGAffineTransformMakeScale(1.5, 1.5)
        }) { (success:Bool) in
                UIView.animateWithDuration(0.5, animations: { 
                    self.transform = CGAffineTransformIdentity
                })
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
