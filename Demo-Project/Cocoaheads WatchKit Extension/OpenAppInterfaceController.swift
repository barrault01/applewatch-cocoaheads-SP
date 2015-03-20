//
//  OpenAppInterfaceController.swift
//  Cocoaheads
//
//  Created by Antoine Barrault on 23/03/2015.
//  Copyright (c) 2015 Antoine Barrault. All rights reserved.
//

import WatchKit
import Foundation


class OpenAppInterfaceController: WKInterfaceController {

    @IBOutlet weak var numberLabel: WKInterfaceLabel!
    var numberOfElements : Int = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        updateEventsNumber()
    }


    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func didClickOnAddNew() {
        
        let dico = ["method":"addEvent"]
        WKInterfaceController.openParentApplication(dico,
            reply: {
                (dicoReplied :[NSObject : AnyObject]!, error : NSError!) -> Void in
                if  let number = dicoReplied["eventsNumber"] as Int? {
                    self.numberOfElements = number
                    self.numberLabel.setText("\(self.numberOfElements)")
                }
                
        })
    }
    
    func updateEventsNumber () {
        
        let dico = ["method":"checkNumber"]
        WKInterfaceController.openParentApplication(dico,
            reply: {
                (dicoReplied :[NSObject : AnyObject]!, error : NSError!) -> Void in
                if  let number = dicoReplied["eventsNumber"] as Int? {
                    self.numberOfElements = number
                    self.numberLabel.setText("\(self.numberOfElements)")
                }

        })
    }
    
    
}
