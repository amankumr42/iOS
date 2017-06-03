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
let STORAGE_BASE = FIRStorage.storage().reference()

class DataService{
 static let ds = DataService()
    // DB REFERENCES
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("post")
    private var _REF_USERS = DB_BASE.child("user")
    private var _REF_ADMIN = DB_BASE.child("admin")
    private var _REF_ADS = DB_BASE.child("ads")
    private var _REF_APP_CONTACTS = DB_BASE.child("app_contacts")
    private var _REF_EVENT = DB_BASE.child("event")
    private var _REF_FB_USER = DB_BASE.child("fb_user")
    private var _REF_PENDING_EVENT = DB_BASE.child("pending_event")
    private var _REF_STORIES = DB_BASE.child("stories")
    private var _REF_TICKET = DB_BASE.child("ticket")
    private var _REF_VENDOR = DB_BASE.child("vendor")
    
    
    //Storage reference
    private var _REF_POST_IMAGES =  STORAGE_BASE.child("")
    
    
    
    var REF_BASE : FIRDatabaseReference{
        return _REF_BASE
    }
    
    var REF_POSTS : FIRDatabaseReference{
        return _REF_POSTS
    }
    
    var REF_USERS : FIRDatabaseReference{
        return _REF_USERS
    }
    
    var REF_ADMIN : FIRDatabaseReference{
        return _REF_ADMIN
    }
    
    var REF_ADS : FIRDatabaseReference{
        return _REF_ADS
    }
    
    var REF_APP : FIRDatabaseReference{
        return _REF_APP_CONTACTS
    }
    var REF_Event:FIRDatabaseReference{
        return _REF_EVENT
    }
    
    var REF_FB_USER : FIRDatabaseReference  {
        return _REF_FB_USER
    }
    
    var REF_PENDING_EVENT : FIRDatabaseReference    {
        return _REF_PENDING_EVENT
    }
    
    var REF_STORIES : FIRDatabaseReference{
        return _REF_STORIES
    }
    var REF_TICKET : FIRDatabaseReference   {
        return _REF_TICKET
    }
    var REF_VENDOR : FIRDatabaseReference{
        return _REF_VENDOR
    }
    var REF_POST_IMAGES : FIRStorageReference{
        return _REF_POST_IMAGES
    }
    
    
    
    // creaetedFirebase user
    func createdFirebaseDBUser(uid : String, userData:Dictionary<String , String>) {
        REF_USERS.child(uid).updateChildValues(userData)
        
    }
    
    
}
