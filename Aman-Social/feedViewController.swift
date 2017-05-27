//
//  ChildViewController1.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/24/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit
import XLPagerTabStrip



//extends class UITableViewDataSource and UITableViewDelegate must for implementing table View Cell and table view cell


class feedViewController: UIViewController , IndicatorInfoProvider ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Adding the eventListner to XCode it is added in after viewDidLoad()
        DataService.ds.REF_POSTS.observe(.value , with : {(snapshot) in
            print (snapshot.value)
            
        })
        
        // Do any additional setup after loading the view.
    }
    
    //To succeesfully implement the table view cell need to implement the three function "number of section" ,
    //"number of rowinsection" and "CellFor AT" : WARNING : If u don't add these yu will be getting the error 
    // message u need to add the above three delegates
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return  tableView.dequeueReusableCell(withIdentifier: "PostCell")  as! PostCell
        
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title : "FEED")
    }

}
