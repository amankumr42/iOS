//
//  ChildViewController1.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/24/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Firebase



//extends class UITableViewDataSource and UITableViewDelegate must for implementing table View Cell and table view cell


class feedViewController: UIViewController , IndicatorInfoProvider ,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Adding the eventListner to XCode it is added in after viewDidLoad()
        DataService.ds.REF_POSTS.observe(.value , with : {(snapshot) in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot]{
                for snap in snapshot{
                    //print("AMANNN:\(snap)")
                    if let postDict = snap.value as? Dictionary <String, Any>{
                        let key =  snap.key
                        print("AMANNNNN : checking the value of the key\(key)")
                        print("RAMANNNNN : checking the value of the postData\(postDict)")
                      let  post = Post(postKey: key, postData: postDict)
                        self.posts.append(post)
                    
                        
                        
                        print("TYYYYY: Checking the POst\(post)")

                    }// end of postDict
                }
            }
            self.tableView.reloadData()
         
                }
)
        
    }
    
    //To succeesfully implement the table view cell need to implement the three function "number of section" ,
    //"number of rowinsection" and "CellFor AT" : WARNING : If u don't add these yu will be getting the error 
    // message u need to add the above three delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
        
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let post = posts[indexPath.row]
        
        if let cell   = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.configureCell(post: post)
            return cell
        }else {
            return PostCell()
        }
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title : "FEED")
    }

}
