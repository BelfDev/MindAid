//
//  Activity.swift
//  MindAid
//
//  Created by Pedro Henrique Belfort Fernandes on 3/26/15.
//  Copyright (c) 2015 Pedro Belfort. All rights reserved.
//

import UIKit

class Activity{
    
    var title:String!
    var imageName:String!
    var description:String!
    
    init(title:String, imageName:String){
        self.title = title
        self.imageName = imageName
    }
    
    
    //Methods
    
    func createImage (imageName:String)->(UIImageView){
        var image = UIImage(named:imageName)
        var imageView = UIImageView (image:image)
        return imageView
    }
}


