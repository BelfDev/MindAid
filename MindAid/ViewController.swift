//
//  ViewController.swift
//  MindAid
//
//  Created by Pedro Henrique Belfort Fernandes on 3/26/15.
//  Copyright (c) 2015 Pedro Belfort. All rights reserved.
//

import UIKit
// Gabriel
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var allDateTime = DAO.getAllDateTime()
        for (var i = 0 ; i < allDateTime!.count ; i++)
        {
            if (allDateTime![i].name == "Morning")
            {
                Data.sharedInstance.morningTime = allDateTime![i]
            }
            else if (allDateTime![i].name == "Afternoon")
            {
                Data.sharedInstance.afternoonTime = allDateTime![i]
            }
            else
            {
                Data.sharedInstance.nightTime = allDateTime![i]
            }
        }
        
    }
    
    
    //
    
    // chega dessa merda

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

