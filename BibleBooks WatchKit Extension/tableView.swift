//
//  tableView.swift
//  BibleBooks
//
//  Created by Perrine, Levi C on 12/14/15.
//  Copyright © 2015 cuw. All rights reserved.
//

import WatchKit
import Foundation


class tableView: WKInterfaceController
{
    
    @IBOutlet var table: WKInterfaceTable!
    var books = [String]()
    
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        var books = watchCore.bibleBooksArray
        
        //Builds randomly-ordered table which includes all the books of the Bible
        self.table.setNumberOfRows(watchCore.bibleBooksArray.count, withRowType: "cell")
        var booksLeft = watchCore.bibleBooksArray
        for(var i = 0; i < watchCore.bibleBooksArray.count; i++)
        {
            let selection = arc4random_uniform(UInt32(booksLeft.count))
            let currRow = self.table.rowControllerAtIndex(i) as! row
            currRow.label.setText("\(watchCore.bibleBooksArray[Int(selection)])")
            booksLeft.removeAtIndex(Int(selection))
        }
    }
    
    override func table(table:WKInterfaceTable, didSelectRowAtIndex rowIndex:Int)
    {
        var placeInList = 0
        if(table.rowControllerAtIndex(rowIndex) as! Int == placeInList)
        {
          watchCore.booksGuessed.append(watchCore.bibleBooksArray[placeInList])
        }
        placeInList ++
    }
    
    override func willActivate()
    {
        super.willActivate()
    }
    
    override func didDeactivate()
    {
        super.didDeactivate()
    }
    
}