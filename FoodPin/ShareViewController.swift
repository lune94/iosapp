//
//  ShareViewController.swift
//  FoodPin
//
//  Created by Melissa Verduci on 15/03/2015.
//  Copyright (c) 2015 Melissa Verduci. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var twitterButton:UIButton!
    @IBOutlet weak var facebookButton:UIButton!
    @IBOutlet weak var emailButton:UIButton!
    @IBOutlet weak var messageButton:UIButton!
    
    override func viewDidLoad() {
        //blur de image bg
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        //on place les button a une position hors ecran
        twitterButton.transform = CGAffineTransformMakeTranslation(0, -500)
        facebookButton.transform = CGAffineTransformMakeTranslation(0, -500)
        emailButton.transform = CGAffineTransformMakeTranslation(0, 500)
        messageButton.transform = CGAffineTransformMakeTranslation(0, 500)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: {
            let scale = CGAffineTransformMakeTranslation(0, 0)
            self.facebookButton.transform = scale
            self.twitterButton.transform = scale
            self.emailButton.transform = scale
            self.messageButton.transform = scale
            }, completion: nil)
    }
    
}
