//
//  ChildViewController3.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/24/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Firebase

class eventViewController: UIViewController ,IndicatorInfoProvider , UITableViewDelegate,UITableViewDataSource{
  
    @IBOutlet weak var tableViewEvent : UITableView!
    
    
    var events = [Event]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewEvent.delegate = self
        tableViewEvent.dataSource = self
        DataService.ds.REF_Event.observe(.value, with: {(snapshot) in
          if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot]{
            for snap in snapshot {
                    print ("AMANEVE:Reading data from snap \(snap)")
    
                    print("AMAN : EventViewController\(snap)")
                    
                    
                    if let eventDict  = snap.childSnapshot(forPath: "/details").value as? Dictionary<String,Any>{
                        
                     //   if let details = snap.childSnapshot(forPath: "/details") as? Dictionary<String,Any>{
                        
                       let key = snap.key
                        print ("AMRITA :: checking \(key)")

                        print("EVENT_DICT : \(eventDict)")
                        
                      // let details = snap.childSnapshot(forPath: "/details")
                     //  print(" CHECK : \(snap.childSnapshot(forPath: "/details/name"))")
                        let event = Event(eventkey : key , eventDict: eventDict)
                        self.events.append(event)
                        print ("CHECKING : value of the \(eventDict)")
                    }// end of outer if
                    
                    
                    //print ("CHECKING : value of the \(eventDict)")
                }
            }
            self.tableViewEvent.reloadData()
            
        })
        

        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let event = events[indexPath.row]
        if let cell = tableViewEvent.dequeueReusableCell(withIdentifier: "EventPostCell") as? EventPostCell{
            cell.configureCell(event : event)
            return cell
        }else{
            return EventPostCell()
        }
        
      
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title : "EVENT")
    }
}
