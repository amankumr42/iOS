//
//  PostCell.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/25/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit
import Firebase

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
 
    
    func configureCell (post :Post , img: UIImage? = nil){
     
        
        self.post = post
        self.caption.text = post.text
        self.likeCount.text = ("/(post.like_count")
        self.usernameLbl.text = post.user_name
        
        if img != nil{
            self.postImg.image = img
        }else{
           let ref = FIRStorage.storage().reference(forURL: post.image)
           ref.data(withMaxSize : 2 * 1024 * 1024 ,completion : { (data ,  error) in
            
            if error != nil {
                print ("AMM : Unable to download image from Firebase Storage")
            }else{
               print ("AMM : Image downloaded from firebase storage")
                if let imageData = data {
                    if let img = UIImage(data: imageData){
                        self.postImg.image = img
                    }
                }
            }
                    
                })
                
                
            }
        }

    @IBAction func ButtonPressed(_ sender: UIButton) {
        changeTxt.setTitle("Liked", for: .normal)
    }
        
        
        }

  

    

