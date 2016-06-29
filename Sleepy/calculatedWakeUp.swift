//
//  ViewController.swift
//  Sleepy
//
//  Created by Ali Mousa on 6/21/16.
//  Copyright © 2016 Ali Mousa. All rights reserved.
//

import UIKit

class CalculatedWakeUp: UICollectionViewController{
    var Array = [String]()
    var wakeUpDate : NSDate!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //CALCULATE THE TIMES HERE
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        
        var calculatedDate = wakeUpDate
        for _ in 1...8{
            //Calculates times to wake up
            calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Minute, value: -90, toDate: calculatedDate, options: NSCalendarOptions.init(rawValue: 0))!
            let element = calculatedDate.descriptionWithLocale(NSTimeZone.description())
            timeFormatter.dateFromString(element)
            Array.insert(timeFormatter.stringFromDate(calculatedDate), atIndex: 0)
            //element.substringWithRange((element.indexOf("at")?.advancedBy(3))!..<(element.indexOf("at")?.advancedBy(8))!), atIndex: 0
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Array.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
        //Credits to Gokul Swamy for styling of cell
        cell.layoutSubviews()
        
        cell.layer.borderColor = UIColor(red:0.98, green:0.55, blue:0.38, alpha:1.0).CGColor
        cell.layer.cornerRadius = cell.layer.frame.width / 2
        cell.layer.shadowColor = UIColor.blackColor().CGColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = CGSizeZero
        cell.layer.shadowRadius = 1
        
        //End credits
        
        
        let label = cell.viewWithTag(1) as! UILabel
        
        label.text = Array[indexPath.row]
        
        return cell
    }
    
}


