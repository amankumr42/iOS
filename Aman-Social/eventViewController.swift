//
//  ChildViewController3.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/24/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class eventViewController: UIViewController ,IndicatorInfoProvider , UITableViewDelegate,UITableViewDataSource{
  
    @IBOutlet weak var tableViewEvent : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewEvent.delegate = self
        tableViewEvent.dataSource = self
        

        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewEvent.dequeueReusableCell(withIdentifier: "EventPostCell") as! EventPostCell
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title : "EVENT")
    }
}
