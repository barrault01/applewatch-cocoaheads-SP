//
//  MenuInterfaceController.swift
//  Cocoaheads
//
//  Created by Antoine Barrault on 23/03/2015.
//  Copyright (c) 2015 Antoine Barrault. All rights reserved.
//

import WatchKit
import Foundation


class MenuInterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
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

    @IBAction func didClickOnDelete() {
        
        let userInfo = ["method":"deleteEvents"]
        WKInterfaceController.openParentApplication(userInfo, reply: { (theReply : [NSObject : AnyObject]!, error : NSError!) -> Void in
            
            
            
        })

        
        println("delete everything")
    }
}
