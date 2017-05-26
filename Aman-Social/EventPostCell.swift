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
    @IBOutlet weak var eventType : UILabel!
    @IBOutlet weak var eventLocation : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
