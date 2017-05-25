//
//  PostCell.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/25/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    
    @IBOutlet weak var profileImg : UIImage!
    @IBOutlet weak var usernameLbl : UILabel!
    @IBOutlet weak var postImg : UIImageView!
    @IBOutlet weak var caption : UITextView!
    @IBOutlet weak var likeLbl : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
