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
import ActionButton

class feedViewController: UIViewController , IndicatorInfoProvider ,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var actionButton : ActionButton!
    
    var posts = [Post]()
    static var imageCache : NSCache<NSString , UIImage> = NSCache()
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        // starting the float button 
        
        let twitterImage = UIImage(named: "icons8-Camera-40")!
        let plusImage = UIImage(named: "icons8-Stack of Photos-50")!
        
        let twitter = ActionButtonItem(title: "camera", image: twitterImage)
        twitter.action = { item in print("Twitter...") }
        
        let google = ActionButtonItem(title: "photo gallery", image: plusImage)
        google.action = { item in print("Google Plus...") }
        
        actionButton = ActionButton(attachedToView: self.view, items: [twitter, google])
        actionButton.action = { button in button.toggleMenu() }
        actionButton.setTitle("+", forState: UIControlState())
        
        actionButton.backgroundColor = UIColor(red: 238.0/255.0, green: 130.0/255.0, blue: 34.0/255.0, alpha:1.0)
        
        
        
        // ending the float button code
       
        print("AMAN :: SETUP is running")
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

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
        
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let post = posts[indexPath.row]
        
        if let cell   = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
         //   var img : UIImage!
            if let img = feedViewController.imageCache.object(forKey: post.image as NSString){
                cell.configureCell(post: post, img: img)
                return cell
            }else{
                cell.configureCell(post: post )
                return cell
            }
          
        }else {
            return PostCell()
        }
    }
    

    
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title : "FEED")
    }
    

}
