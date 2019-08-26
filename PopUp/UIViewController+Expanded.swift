//
//  UIViewController+Expanded.swift
//  PopUp
//
//  Created by MyGlamm on 8/23/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//

import UIKit


extension UIViewController
{
    
    static var toolTipView : ToolTipView?
    
    //Adding the template View with only text
    func addedToBagToolTip(){
        
        //Localize String....
        addToolTip(text: "Added To Bag")
    }
    
    // Adding the template View of Image and Text
    func giftItemImageAddedToBagToolTip(){
        
        //Localize String
        let text = "Gift item added to bag with this product"
        
        let imageName = "gift.jpg"
        
        //Font Family Name
        let fontFamily = "Chalkduster"
        
        //Font Size
        let fontSize : CGFloat = 18.0
        
        let imageNText = imageAndText(text: text, imageName: imageName, fontFamily: fontFamily, fontSize: fontSize)
        
        addToolTipWithImage(textWithImage: imageNText)
        
    }
    
    //Func to addToolTip with user defined Message No image
    func addToolTip(text : String?){
        
        if UIViewController.toolTipView == nil{
            UIViewController.toolTipView = ToolTipView()
            UIViewController.toolTipView!.labelText = text ?? ""
            
            displayToolTip(toolTipView: UIViewController.toolTipView!)
        }
        
    }
    
    //Func to addToolTip with user defined Message and Image
    func addToolTipWithImage(textWithImage : NSAttributedString){
        
        if UIViewController.toolTipView == nil{
            UIViewController.toolTipView = ToolTipView()
            UIViewController.toolTipView!.labelTextWithImage = textWithImage
            
            
            displayToolTip(toolTipView: UIViewController.toolTipView!)
        }
        
    }
    
    
    // For Display The Tooltip
    func displayToolTip(toolTipView : UIView){
        
        
        
        let currentWindow: UIWindow? = UIApplication.shared.keyWindow
        currentWindow?.addSubview(toolTipView)
        
        toolTipView.alpha = 0
        
        
        
        UIView.animate(withDuration: 1, animations: {
            toolTipView.alpha = 1
        }) { [unowned self](bool) in
            self.dismissToolTipView()
        }
        
        toolTipView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: toolTipView, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: navigationController?.navigationBar, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -10).isActive = true
        
        NSLayoutConstraint(item: toolTipView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: navigationController?.navigationBar, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -10).isActive = true
        
        
        NSLayoutConstraint(item: toolTipView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 50).isActive = true
        
        NSLayoutConstraint(item: toolTipView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 500).isActive = true
        
        
        
    }
    
    
    
    
    
    //Creating Image with Text
    func imageAndText(text : String , imageName : String,fontFamily : String,fontSize : CGFloat) -> NSAttributedString{
        
        
        let font = UIFont(name: fontFamily, size: fontSize)
        
        
        // create an NSMutableAttributedString that we'll append everything to
        let fullString = NSMutableAttributedString(string: text, attributes: [ NSAttributedString.Key.font: font! ])
        
        
        
        
        // create our NSTextAttachment
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: imageName)
        
        let imageSizeWidth : CGFloat = 20 , imageSizeHeight  : CGFloat = 20
        
        image1Attachment.bounds = CGRect(x: 0, y: (font!.capHeight - imageSizeHeight).rounded()/2, width: imageSizeWidth, height: imageSizeHeight)
        
        
        
        
        let image1String = NSMutableAttributedString(attributedString: NSAttributedString(attachment: image1Attachment))
        
        //spaced String appended
        image1String.append(NSAttributedString(string: "   "))
        
        image1String.append(fullString)
        
        
        return image1String
        
        
    }
    
    func dismissToolTipView(){
        
        if UIViewController.toolTipView != nil{
            UIView.animate(withDuration: 1, delay: 5, options: .curveEaseOut, animations: {
                UIViewController.toolTipView!.alpha = 0
            }) { (bool) in
                UIViewController.toolTipView!.removeFromSuperview()
                UIViewController.toolTipView = nil
            }
            
        }
        
        
        
    }
    
    
}
