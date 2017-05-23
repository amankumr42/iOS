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


class SignInVC: UIViewController {

    @IBOutlet weak var emailField: FancyField!
    
    @IBOutlet weak var pwdField: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
            }
        
        })
        
    }

    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text , let pwd = pwdField.text{
         
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user , error) in
                if error == nil {
                    print("JMM : Email Authenticate with firebase")
                } else{
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: {(user ,error) in
                        if error != nil {
                            print ("JMM : Unable to authenticate with Firebase")
                        } else{
                            print ("JMM : Successully authenticate with Firebase")
                        }
                        
                    })
                }
                
            })
        }
        
    }
}

