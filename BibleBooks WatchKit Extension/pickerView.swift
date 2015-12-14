//
//  pickerView.swift
//  BibleBooks
//
//  Created by Perrine, Levi C on 12/14/15.
//  Copyright © 2015 cuw. All rights reserved.
//

import WatchKit
import Foundation


class pickerView: WKInterfaceController
{
    @IBOutlet var picker: WKInterfacePicker!
    
    var selectedItem = 0
    var pickerItems = [WKPickerItem]()

    
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
    }
    
    //Sets a var to the value returned by "picker" (constantly)
    @IBAction func optionSelected(value: Int)
    {
        self.selectedItem = value
    }
    
    func update()
    {
        if(pickerItems.count < watchCore.booksGuessed.count)
        {
            pickerItems.append(WKPickerItem())
            pickerItems[pickerItems.count].title = watchCore.booksGuessed[pickerItems.count]
        }
    }
    
    override func willActivate()
    {
        super.willActivate()
        
        self.update()
    }
    
    override func didDeactivate()
    {
        super.didDeactivate()
    }
    
}