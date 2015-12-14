//
//  phoneTableView.swift
//  BibleBooks
//
//  Created by Perrine, Levi C on 12/14/15.
//  Copyright © 2015 cuw. All rights reserved.
//

import UIKit
import WatchConnectivity

class phoneTableView: UIViewController, WCSessionDelegate
{
    
    @IBOutlet weak var actualTable: UITableView!
    
    var session : WCSession!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        PhoneCore.guessesTable = actualTable
        
        if WCSession.isSupported()
        {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
            
        }
    }
    
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject])
    {
        PhoneCore.guessesMade.append(message["newGuess"] as! String)
        dispatch_async(dispatch_get_main_queue())
            {() -> Void in self.actualTable.reloadData()}
    }
    
    
    
    
    override func didReceiveMemoryWarning()
        {super.didReceiveMemoryWarning()}
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
        {return 1}
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {return PhoneCore.guessesMade.count}
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel!.text = (PhoneCore.guessesMade[indexPath.row])
        return cell
    }
}