//
//  Data.swift
//  MindAid
//
//  Created by Pedro Henrique Belfort Fernandes on 3/30/15.
//  Copyright (c) 2015 Pedro Belfort. All rights reserved.
//

import Foundation

private let data = Data()

class Data{
    
    var morningTime:DateTime!
    var afternoonTime:DateTime!
    var nightTime:DateTime!
    
    class var sharedInstance: Data{
        return data
    }
    
    init(){
        
    }
    
}