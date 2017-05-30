//
//  Post.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/27/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import Foundation

class Post{

    
    private var _like_count : Int!//1
    private var _post_time : Int!//2
    private var _text : String! // done 3
    private var _user_fb_id : Int!//4
    private var _user_name : String!//5
    private var _comment_count : Int!//6
    private var _visiblity : String!//7
    private var _image : String!//8
    private var _postKey : String!//9

    var text : String{
        return _text
    }
    
    var image : String{
        return _image
    }
    var user_name : String{
        return _user_name
    }
    var visiblity : String{
        return _visiblity
    }
    var like_count : Int{
        return _like_count
    }
    var post_time : Int{
        return _post_time
    }
    var postKey : String{
        return _postKey
    }
    
    var user_fb_id : Int {
        return _user_fb_id
    }
    var comment_count : Int{
        return _comment_count
    }
  
    init (text : String ,image :String ,user_name :String,visiblity : String,like_count : Int , post_time : Int , user_fb_id : Int,comment_count : Int){
        self._text = text
        self._image = image
        self._user_name = user_name
        self._visiblity = visiblity
        self._like_count = like_count
        self._post_time = post_time
        self._user_fb_id = user_fb_id
        self._comment_count = comment_count
    }
    
    init (postKey : String , postData : Dictionary<String,Any>){
        self._postKey = postKey
  
        if let text =  postData["text"] as? String{
            self._text = text
        }
        
        if let  image = postData["image"] as? String{
            self._image = image
        }
        if let user_name = postData["user_name"] as? String{
            self._user_name = user_name
         }
        if let comment_count = postData["like_count"] as? Int{
            self._comment_count = comment_count
        }
        if let post_time = postData["post_time"] as? Int{
            self._post_time = post_time
        }
        if let user_fb_id = postData["user_fb_id"] as? Int{
            self._user_fb_id = user_fb_id
        }
        if let visiblity = postData["visibility"] as? String{
            self._visiblity = visiblity
        }
        
        if let like_count = postData["like_count"] as? Int{
            self._like_count = like_count
        }
        
    }
    
    
    
    
    
    
    
}
