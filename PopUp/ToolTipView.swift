//
//  ToolTipView.swift
//  PopUp
//
//  Created by MyGlamm on 8/23/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//

import UIKit
@IBDesignable
class ToolTipView: UIView {
    
    
    private var label = UILabel()
    
    var labelText = ""{
        didSet {
            label.text = labelText
        }
    }
    
    var labelTextWithImage : NSAttributedString?{
        didSet{
            label.attributedText = labelTextWithImage
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupLabel()
        
    }
    
    
    private func setupLabel(){
        
        backgroundColor = .clear
        
        
        label.text = ""
        label.numberOfLines = 0
        

        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading, multiplier: 1,
                           constant: 20).isActive = true
        NSLayoutConstraint(item: label,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing, multiplier: 1,
                           constant: -20).isActive = true
        

        NSLayoutConstraint(item: label,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .top, multiplier: 1,
                           constant: 35).isActive = true
        
        NSLayoutConstraint(item: label,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .bottom, multiplier: 1,
                           constant: -15).isActive = true
        
        
        
    }
    
    
    
    
    override func draw(_ rect: CGRect) {
        
        let myBezier = UIBezierPath()
        
        let toolTipArrowHeight : CGFloat = 20
        
        let placeToStartDrawingArrow : CGPoint = CGPoint(x: (rect.width - CGFloat(0.7 * toolTipArrowHeight)) , y: toolTipArrowHeight)
        
        let placeToGoUpAtTipOfArrow = CGPoint(x: (rect.width - CGFloat(0.7 * toolTipArrowHeight) - (toolTipArrowHeight/2)), y: 0)
        
        let placeToEndDrawingArrow = CGPoint(x: (rect.width - CGFloat(0.7 * toolTipArrowHeight) - (toolTipArrowHeight)), y: toolTipArrowHeight)
        
        myBezier.move(to: CGPoint(x: rect.width, y: toolTipArrowHeight))
        
        myBezier.addLine(to: placeToStartDrawingArrow)
        
        myBezier.addLine(to: placeToGoUpAtTipOfArrow)
        
        myBezier.addLine(to: placeToEndDrawingArrow)
        
        myBezier.addLine(to: CGPoint(x: 0, y: toolTipArrowHeight))
        
        myBezier.addLine(to: CGPoint(x: 0, y: rect.height))
        
        
        myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
        
        
        myBezier.close()
        
        // myBezier.addLine(to: CGPoint(x: rect.width, y: toolTipArrowHeight))
        
        let context = UIGraphicsGetCurrentContext()
        context!.setLineWidth(4.0)
        //UIColor(red: 255.0, green: 151.0, blue: 151.0, alpha: 1).setFill()
        
        
        #colorLiteral(red: 1, green: 0.5921568627, blue: 0.5921568627, alpha: 1).setFill()
        //UIColor(red: CGFloat(255/255), green: CGFloat(151/255), blue: CGFloat(151/255), alpha: 1).setFill()
        myBezier.fill()
        
    }
}
