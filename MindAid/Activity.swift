//
//  Activity.swift
//  MindAid
//
//  Created by Pedro Henrique Belfort Fernandes on 3/26/15.
//  Copyright (c) 2015 Pedro Belfort. All rights reserved.
//

import UIKit

class Activity: NSObject {
    
    var title:String = String()
    var imageString:String = String()
    
    //Methods
    
    func createImage (imageName:String)->(UIImageView){
        var image = UIImage(named:imageName)
        var imageView = UIImageView (image:image)
        return imageView
    }
    
    //AGORA VAI ALT na DEV
    //Mudei pra ver se rola
    //Mudança 2
    //Mudança 3]
    //Mudança 4
    //Mudança 5
}

