//
//  Event.swift
//  Aman-Social
//
//  Created by Aman Kumar on 5/31/17.
//  Copyright © 2017 Aman Kumar. All rights reserved.
//

import Foundation

class Event{
    
    private var _category : String!
    private var _description: String!
    private var  _end_time :  String!
    private var  _event_id : String!
    private var _image : String!
    private var _keywords : String!
    private var _name : String!
    private var _no_of_tickets : String!
    private var _page_views : Int!
    private var _plan: String!
    private var _start_time : String!
    private var _status : String!
    private var _ticketprice : String!
    private var _venue  : String!
    private var _venue_name : String!
    private var _eventKey : String!
    private var _details : String!
    
    var category : String {
        return _category
    }
    
    var description : String{
        return _description
    }
    var end_time : String{
        return _end_time
    }
    var event_id : String{
        return _event_id
    }
    var image : String {
        return _image
    }
    var keywords : String{
        return _keywords
    }
    var name : String{
        return _name
    }
    
    var no_of_tickets : String{
        return _no_of_tickets
    }
    
    var page_views : Int{
        return _page_views
    }
    
    var plan : String{
        return _plan
    }
    var start_time : String{
        return _start_time
    }
    
    var status : String{
        return _status
    }
    var tickeprice : String{
        return _ticketprice
    }
    var venue : String{
        return _venue
    }
    
    var  venue_name : String{
        return _venue_name
    }
    
    var eventkey : String{
        return _eventKey
    }
    var detail : String{
        return _details
    }
    init (category : String ,description :String ,end_time :String,event_id : String,image : String , keywords : String ,name : String , no_of_tickets : String,page_views: Int , plan : String ,start_time: String,status : String,tickeprice : String , venue : String , venue_name : String , eventkey : String , detail:String ){
        self._category = category
        self._description = description
        self._end_time = end_time
        self._event_id = event_id
        self._image = image
        self._keywords = keywords
        self._name = name
        self._no_of_tickets = no_of_tickets
        self._page_views = page_views
        self._plan = plan
        self._start_time = start_time
        self._status = status
        self._ticketprice = tickeprice
        self._venue = venue
        self._venue_name = venue_name
        self._eventKey = eventkey
        self._details = detail
    }
    
    init (eventkey : String , eventDict : Dictionary<String,Any>){
        
        self._eventKey = eventkey
        
        if let category =  eventDict["category"] as? String{
            self._category = category
        }
        
        if let  description = eventDict["description"] as? String{
            self._description = description
        }
        if let end_time = eventDict["end_time"] as? String{
            self._end_time = end_time
        }
        if let event_id = eventDict["event_id"] as? String{
            self._event_id = event_id
        }
        if let keywords = eventDict["keywords"] as? String{
            self._keywords = keywords
        }
        if let name = eventDict["name"] as? String{
            self._name = name
        }
        if let no_of_tickets = eventDict["no_of_tickets"] as? String{
            self._no_of_tickets = no_of_tickets
        }
        
        if let page_views = eventDict["page_views"] as? Int{
            self._page_views = page_views
        }
        if let plan = eventDict["plan"] as? String{
            self._plan = plan
        }
        if let start_time = eventDict["start_time"] as? String{
            self._start_time = start_time
        }
        if let status = eventDict["status"] as? String{
            self._status = status
        }
        if let ticketprice = eventDict["ticketprice"] as? String{
            self._ticketprice = ticketprice
        }
        if let venue = eventDict["venue"] as? String{
            self._venue = venue
        }
        if let eventkey = eventDict["eventkey"] as? String{
            self._eventKey = eventkey
        }
        if let details = eventDict["details"] as? String{
            self._details = details
        }
    }    
}
