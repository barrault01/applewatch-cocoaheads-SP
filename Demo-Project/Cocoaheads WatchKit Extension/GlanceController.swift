//
//  GlanceController.swift
//  Cocoaheads WatchKit Extension
//
//  Created by Antoine Barrault on 20/03/2015.
//  Copyright (c) 2015 Antoine Barrault. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    @IBOutlet weak var numberLabel: WKInterfaceLabel!
    
    override func willActivate() {
        let userInfo = ["method":"glance"]
        WKInterfaceController.openParentApplication(userInfo, reply: { (theReply : [NSObject : AnyObject]!, error : NSError!) -> Void in
            
            if error == nil {
              
                if let dico = theReply {
                 
                    if let number  = dico["eventsNumber"] as? NSNumber {
                        self.numberLabel.setText("\(number)")

                    }
                }
                
            }
            
            
        })
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
