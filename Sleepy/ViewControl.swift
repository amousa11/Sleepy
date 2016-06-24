//
//  ViewControl.swift
//  Sleepy
//
//  Created by Ali Mousa on 6/23/16.
//  Copyright © 2016 Ali Mousa. All rights reserved.
//

import Foundation
import UIKit

class ViewControl : UIViewController{
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var zzz: UIButton!
    @IBOutlet var calculate: UIButton!
    
    
    override func viewDidLoad() {
        zzz.layoutSubviews()
        
        zzz.layer.borderColor = UIColor(red:0.98, green:0.55, blue:0.38, alpha:1.0).CGColor
        zzz.layer.cornerRadius = zzz.layer.frame.width / 2
        zzz.layer.shadowColor = UIColor.blackColor().CGColor
        zzz.layer.shadowOpacity = 0.5
        zzz.layer.shadowOffset = CGSizeZero
        zzz.layer.shadowRadius = 1
        
        calculate.layoutSubviews()
        
        calculate.layer.borderColor = UIColor(red:0.98, green:0.55, blue:0.38, alpha:1.0).CGColor
        calculate.layer.cornerRadius = zzz.layer.frame.width / 2
        calculate.layer.shadowColor = UIColor.blackColor().CGColor
        calculate.layer.shadowOpacity = 0.5
        calculate.layer.shadowOffset = CGSizeZero
        calculate.layer.shadowRadius = 1
        
    }
    
    @IBAction func next() {
        let valueToPass = NSDate() // Could be anything that conforms to AnyObject
        self.performSegueWithIdentifier("calculated", sender: valueToPass) // Use this method unless you're connecting a button to a viewcontroller in storyboard
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "calculated"{
        let vc2 = segue.destinationViewController as! CalculatedWakeUp // The viewcontroller you're going to
        vc2.wakeUpDate = datePicker.date // If you connected button to vc in storyboard sender will be nil, so in that case just set the vc2.date directly here
        }
    }
}