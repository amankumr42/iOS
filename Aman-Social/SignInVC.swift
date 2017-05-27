//
//  ViewController.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/17/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper



class SignInVC: UIViewController {

    @IBOutlet weak var emailField: FancyField!
    
    @IBOutlet weak var pwdField: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    // If it is aleady login by user it will direct to the main page...
    
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            performSegue(withIdentifier: "goToFeed" , sender: nil)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin =  FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self){
            (result,error) in
            if error != nil {
                print ("JMM : authentical with facebook \(String(describing :error))")
                
            }
            else if result?.isCancelled == true{
                print("JMM : USER CAN facebook autherization")
            }else {
                print ("JMM : SUCCESS with facebook")
                let credentials = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                
               self.firebaseAuth(credentials)
            }
            
            
        }
        
        
    }
    
    func firebaseAuth(_ credential : FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential, completion: {(user , error) in
            if error != nil {
                print ("AMAN: Unable to authenticate with firebase - \(String(describing: error))")
                
            }else{
                print("Aman : Success with FIREBASE")
                if let user = user {
                // KeychainWrapper.standard.set(user.uid, forKey: KEY_UID)
                    let userData = ["provider": user.providerID]
                    
                  self.completeSignIn(id: user.uid,userData: userData)
                    
                }
            }
        
        })
        
    }

    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text , let pwd = pwdField.text{
         
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user , error) in
                if error == nil {
                    print("JMM : Email Authenticate with firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        
                       self.completeSignIn(id: user.uid , userData: userData)
                    }
                   
                } else{
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: {(user ,error) in
                        if error != nil {
                            print ("JMM : Unable to authenticate with Firebase")
                        } else{
                            print ("JMM : Successully authenticate with Firebase")
                            
                            if let user = user {
                                let userData = ["provider": user.providerID]
                             self.completeSignIn(id: user.uid,userData: userData)
                            }
                          
                        }
                        
                    })
                }
                
            })
        }
        
    }
    
    func completeSignIn(id :  String, userData : Dictionary<String,String>){
        DataService.ds.createdFirebaseDBUser(uid: id, userData:userData)
        let keychainresult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print ("JMM : Data saved to key chain \(keychainresult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
    
}

