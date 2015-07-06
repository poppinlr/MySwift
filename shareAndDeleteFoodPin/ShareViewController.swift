//
//  ShareViewController.swift
//  shareAndDeleteFoodPin
//
//  Created by 沈卓晨 on 15/7/6.
//  Copyright (c) 2015年 poppinlr. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var buttonF:UIButton!
    @IBOutlet weak var buttonT:UIButton!
    @IBOutlet weak var buttonM:UIButton!
    @IBOutlet weak var buttonE:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = view.bounds
        
        backgroundImageView.addSubview(visualEffectView)
        
        
        //
        // Move the buttons off screen (bottom)
        let translateDown = CGAffineTransformMakeTranslation(0, 500)
        buttonF.transform = translateDown
        buttonM.transform = translateDown
        
        // Move the buttons off screen (top)
        let translateUp = CGAffineTransformMakeTranslation(0, -500)
        buttonT.transform = translateUp
        buttonE.transform = translateUp
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        buttonF.hidden = false
        buttonT.hidden = false
        buttonE.hidden = false
        buttonM.hidden = false
        
        let translate = CGAffineTransformMakeTranslation(0, 0)
        
        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
            self.buttonF.transform = translate
            self.buttonE.transform = translate
        }, completion: nil)
        
        UIView.animateWithDuration(0.7, delay: 0.8, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
            self.buttonT.transform = translate
            self.buttonM.transform = translate
            }, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
