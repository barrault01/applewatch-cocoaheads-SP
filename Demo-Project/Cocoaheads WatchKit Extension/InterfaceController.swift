//
//  InterfaceController.swift
//  Cocoaheads WatchKit Extension
//
//  Created by Antoine Barrault on 20/03/2015.
//  Copyright (c) 2015 Antoine Barrault. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var table: WKInterfaceTable!
    
    var rows = ["Animation","Open App","Menu","Modal","Text Input"]

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        loadTable()
    }
    
    func loadTable () {
        table.setNumberOfRows(rows.count, withRowType: "myRow")
        for (index, value ) in enumerate(rows) {
            let atualRowForThisIndex = table.rowControllerAtIndex(index) as! MyWatchCell
            atualRowForThisIndex.labelOnCell.setText(value)
        }
    }
    
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    

    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        switch rowIndex {
        case 0 : self.pushControllerWithName("animation", context: nil)
        case 1 : self.pushControllerWithName("openApp", context: nil)
        case 2 : self.pushControllerWithName("Menu", context: nil)
        case 3 : self.presentModalViewPageView()
        default : self.presentTextInput()
            
        }
    }
    
    func presentModalViewPageView () {
        
        var array : NSArray = ["modalFirstScreen","modalSecondScreen","modelThirdScreen"]
        
        
        var array2 = [rows[3],"2","3"]
        
        self.presentControllerWithNames(array as [AnyObject], contexts: array2)

    }
    
    func presentTextInput () {
        
        
        self.presentTextInputControllerWithSuggestions(["YES","NO","MAYBE"], allowedInputMode: .AllowAnimatedEmoji) { (answer : [AnyObject]!) -> Void in
            
            println(answer)
            
        }
        
    }
    
    override func handleActionWithIdentifier(identifier: String?, forRemoteNotification remoteNotification: [NSObject : AnyObject]) {
        self.presentControllerWithName("notification", context: nil)
    }
}
