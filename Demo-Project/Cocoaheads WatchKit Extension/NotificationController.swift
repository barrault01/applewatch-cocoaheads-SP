//
//  NotificationController.swift
//  Cocoaheads WatchKit Extension
//
//  Created by Antoine Barrault on 20/03/2015.
//  Copyright (c) 2015 Antoine Barrault. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {

    @IBOutlet weak var text: WKInterfaceLabel!
    @IBOutlet weak var firstImage: WKInterfaceImage!
    @IBOutlet weak var secondImage: WKInterfaceImage!
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        firstImage.setImageNamed("cocoaheads")
        secondImage.setImageNamed("cocoaheads_br")
        completionHandler(.Custom)
    }
    
    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        
        if let aps = remoteNotification["aps"] as? [NSObject : AnyObject] {
            
            if let alert = aps["alert"]  as? [NSObject : AnyObject]{
                
                if let body = alert["body"]  as? String {
                    text.setText(body)

                }
            }
        }
        
        firstImage.setImageNamed("cocoaheads")
        secondImage.setImageNamed("cocoaheads_br")

        completionHandler(.Custom)
    }
}
