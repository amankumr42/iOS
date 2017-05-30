//
//  PostCell.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/25/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    
    @IBOutlet weak var profileImg: UIImageView!
  
    @IBOutlet weak var usernameLbl: UILabel!

    @IBOutlet weak var changeTxt: UIButton!
  
    @IBOutlet weak var postImg : UIImageView!
    @IBOutlet weak var caption : UITextView!
    @IBOutlet weak var likeCount: UILabel!
    
    var post : Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    
    func configureCell(post : Post){
        self.post  = post
        self.caption.text = post.text
        self.usernameLbl.text = post.user_name
        self.likeCount.text = "\(post.comment_count)"
        
        
        
    }
    
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        changeTxt.setTitle("Liked", for: .normal)
        
    }
    
    
}
