//
//  TodayViewController.swift
//  SleepyExtension
//
//  Created by Ali Mousa on 6/29/16.
//  Copyright © 2016 Ali Mousa. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UICollectionViewController, NCWidgetProviding {
    var Array = [String]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        preferredContentSize = CGSizeMake(0, 220.0)
        //CALCULATE THE TIMES HERE
        let currentDate = NSDate()
        
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        
        var calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Minute, value: 180, toDate: currentDate, options: NSCalendarOptions.init(rawValue: 0))!
        for _ in 1...6{
            //Calculates times to wake up
            calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Minute, value: 90, toDate: calculatedDate, options: NSCalendarOptions.init(rawValue: 0))!
            let element = calculatedDate.descriptionWithLocale(NSTimeZone.description())
            timeFormatter.dateFromString(element)
            Array.append(timeFormatter.stringFromDate(calculatedDate))
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Array.count
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
        //Credits to Gokul Swamy for styling of cell
        cell.layoutSubviews()
        
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
