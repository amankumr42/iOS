//
//  FancyView.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/17/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit

class FancyView: UIView {

    override func awakeFromNib() {
        layer.shadowColor = UIColor(red : SHADOW_GRAY, green : SHADOW_GRAY, blue : SHADOW_GRAY , alpha : 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }

}
