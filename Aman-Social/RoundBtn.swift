//
//  RoundBtn.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/17/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red : SHADOW_GRAY, green : SHADOW_GRAY, blue : SHADOW_GRAY , alpha : 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        imageView?.contentMode = .scaleAspectFit
        //layer.cornerRadius = 5.0 making corner round of button in our case fb button
        
    }
  
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius =  self.frame.width / 2
        
    }
    

}
