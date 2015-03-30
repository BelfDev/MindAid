//
//  DateTime.swift
//  MindAid
//
//  Created by Pedro Henrique Belfort Fernandes on 3/30/15.
//  Copyright (c) 2015 Pedro Belfort. All rights reserved.
//

import Foundation

class DateTime{
    var name:String!
    var activities:[Activity]?
    
    init(name:String){
        self.name = name
        self.activities = [Activity]() //Fake data for testing
        
    }
    
    func orderActivities() ->[Activity]?{
        return nil
    }
    
}