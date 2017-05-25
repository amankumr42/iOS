//
//  signOut.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/24/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class signOut: UIViewController {
/// SignOut not attached
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    /// ADDD IB ACTION that is pusing the button so add the IBACTION using button of signout
    
    @IBAction func signOutTapped(_ sender : Any){
   let keychainResult =   KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        
        print ("JMM : Getting the keychainResult and ID removed from key chain\(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        
        // add the segue to the first page from this page
        performSegue(withIdentifier: "goToSignIN", sender: nil)
        // withIdentifier is the name of seague connecting to the first page
        
    }

    
    
    
}
