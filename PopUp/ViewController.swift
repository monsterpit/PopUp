//
//  ViewController.swift
//  PopUp
//
//  Created by MyGlamm on 8/22/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toolTipView: ToolTipView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
     

        
    }
    
    override func viewWillAppear(_ animated: Bool) {

        
        let addToBagBarButton = UIBarButtonItem(image: UIImage(named: "bag3"), style: .done, target: self, action: #selector(addToBag))
        
        addToBagBarButton.tintColor = UIColor.black
        
        navigationItem.rightBarButtonItem = addToBagBarButton
        
        navigationItem.rightBarButtonItems?.append(UIBarButtonItem(title: "Hello", style: .done, target: self, action: #selector(helloBarButtonPressed(sender:))))
        
        
    }
    
    
    @IBAction func ButtonTap(_ sender: UIButton) {
        
        print("Button tapped")
        
        dismissToolTipView()
        
    }
    
    @objc
    func addToBag(){
        giftItemImageAddedToBagToolTip()
       //addedToBagToolTip()
    }
    
    
    @objc
    func doneBarButtonPressed(sender : UIBarButtonItem){
        print("I am pressed")
        
        
        
        dismissToolTipView()
        

        
    }
    
    
    
    @objc
    func helloBarButtonPressed(sender : UIBarButtonItem){
        print("I am pressed")
        
        print(sender.title)
    }
    
    
    
    
}


