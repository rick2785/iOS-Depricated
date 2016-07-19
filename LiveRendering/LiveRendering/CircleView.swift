//
//  CircleView.swift
//  LiveRendering
//
//  Created by Rickey Hrabowskie on 7/18/16.
//  Copyright © 2016 Rickey Hrabowskie. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {

    var circleLayer:CAShapeLayer!
    @IBInspectable var circleLayerColor:UIColor = UIColor.darkGrayColor() {
        didSet {updateCircleProperties()}
    }
    
    @IBInspectable var borderWidth:CGFloat = 1 {
        didSet {updateCircleProperties()}
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutCircle()
    }
    
    func layoutCircle() {
        if circleLayer == nil {
            circleLayer = CAShapeLayer()
            layer.addSublayer(circleLayer)
            
            let rect = CGRectInset(bounds, borderWidth / 2, borderWidth / 2)
            
            let path = UIBezierPath(ovalInRect: rect)
            
            circleLayer.fillColor = circleLayerColor.CGColor
            circleLayer.lineWidth = borderWidth
            
            circleLayer.path = path.CGPath
            
        }
    }
    
    func updateCircleProperties() {
        if circleLayer != nil {
            circleLayer.fillColor = circleLayerColor.CGColor
            circleLayer.lineWidth = borderWidth
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    
}
