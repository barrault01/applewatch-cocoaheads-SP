//
//  AnimationInterfaceController.swift
//  Cocoaheads
//
//  Created by Antoine Barrault on 22/03/2015.
//  Copyright (c) 2015 Antoine Barrault. All rights reserved.
//

import WatchKit
import Foundation


class AnimationInterfaceController: WKInterfaceController {

    @IBOutlet weak var image: WKInterfaceImage!
    
    override func willActivate() {

        image.setImageNamed("Copie de frame_0")
        let animateRange = NSRange(location: 0, length: 75)
        image.startAnimatingWithImagesInRange(animateRange, duration: 4.0, repeatCount: 0)
        super.willActivate()
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }



    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
