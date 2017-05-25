//
//  ChildViewController2.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/24/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class youViewController: UIViewController , IndicatorInfoProvider    {

    @IBOutlet weak var featureScrollView: UIScrollView!
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        imageArray = [#imageLiteral(resourceName: "sliderImg3"), #imageLiteral(resourceName: "sliderImg2"),#imageLiteral(resourceName: "sliderImg1")]
        
        for i in 0..<imageArray.count{
            
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleAspectFit
            let xPosition = (self.view.frame.width) * CGFloat(i)
            imageView.frame =  CGRect(x: xPosition, y: 0, width: self.featureScrollView.frame.width, height: self.featureScrollView.frame.height)
            featureScrollView.scrollRectToVisible( imageView.frame, animated: true)
            featureScrollView.contentSize.width = featureScrollView.frame.width * CGFloat(i + 1)
            featureScrollView.addSubview(imageView)
            //featureScrollView.scrollRectToVisible( imageView.frame, animated: true)
        }
        
        
        
    }

  
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title : "YOU")
    }


}
