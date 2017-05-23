//
//  FancyField.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/22/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit

class FancyField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor(red : SHADOW_GRAY ,green : SHADOW_GRAY , blue : SHADOW_GRAY ,alpha : 0.2  ).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius  = 2.0
        
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.insetBy(dx: 10, dy: 5)
    }
}
