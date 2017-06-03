//
//  EventPostCell.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/26/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit

class EventPostCell: UITableViewCell {

    @IBOutlet weak var eventImg : UIImageView!
    @IBOutlet weak var eventName : UILabel!
    @IBOutlet weak var eventTime : UILabel!
    @IBOutlet weak var eventPlace : UILabel!
    @IBOutlet weak var eventType: UILabel!
    
    @IBOutlet weak var eventLocation : UILabel!
    @IBOutlet weak var eventDescription : UILabel!
    
    
    var event : Event!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    

    func configureCell(event : Event){
  
      
      self.event = event
      self.eventName.text = event.name
     // self.eventType.text = event.plan
        self.eventTime.text = event.start_time
        
        
 
        
    
    }
 


}
    
