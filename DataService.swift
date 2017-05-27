//
//  DataService.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/26/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = FIRDatabase.database().reference() // contains the url of the database


class DataService{
 static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("Post")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE : FIRDatabaseReference{
        return _REF_BASE
    }
    
    var REF_POSTS : FIRDatabaseReference{
        return _REF_POSTS
    }
    
    var REF_USERS : FIRDatabaseReference{
        return _REF_USERS
    }
    
    //
    func createdFirebaseDBUser(uid : String, userData:Dictionary<String , String>) {
        REF_USERS.child(uid).updateChildValues(userData)
        
    }
    
    
}
