//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Melissa Verduci on 15/03/2015.
//  Copyright (c) 2015 Melissa Verduci. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var dialogView:UIView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //creation objet blur
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        //creation dun effect visuel
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        //effet du text qui va grossir
        //on applique une transformation qui comment tout petit a 0 0
        dialogView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
    }
    override func viewDidAppear(animated: Bool)
    {
        UIView.animateWithDuration(0.7, delay: 0.0,options: nil, animations:
            {
                self.dialogView.transform = CGAffineTransformMakeScale(1, 1) //scale to original size
            }, completion:nil)
    }

    
}
