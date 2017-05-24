//
//  Feed.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/23/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class Feed: UIViewController , IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title : "FEED")
    }
    

}
