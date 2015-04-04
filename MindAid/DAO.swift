//
//  DAOActivity.swift
//  MindAid
//
//  Created by Pedro Henrique Belfort Fernandes on 3/30/15.
//  Copyright (c) 2015 Pedro Belfort. All rights reserved.
//

import Foundation
// Tatiana
class DAO{
    
    class func saveActivity(activity:Activity,dayTime:String!)->Bool {
        
        println("DAO -> saveActivity -> inicio")
        
        var pathAux = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path = pathAux.stringByAppendingPathComponent("ActivityList.plist")
        var fileManager = NSFileManager.defaultManager()
        if (!(fileManager.fileExistsAtPath(path)))
        {
            var bundle : NSString! = NSBundle.mainBundle().pathForResource("ActivityList", ofType: "plist")
            fileManager.copyItemAtPath(bundle, toPath: path, error:nil)
        }
        
        var data: NSMutableDictionary! = NSMutableDictionary(contentsOfFile: path)
        var activityNum:String
        var activityInfo:NSMutableDictionary
        
        activityInfo = ["Title": activity.title, "ImageName": activity.imageName, "Description": activity.description]
        
        if dayTime.hasPrefix("morning") {
            activityNum = "morning\(data.count)"
        }
        else if dayTime.hasPrefix("afternoon") {
            activityNum = "afternoon\(data.count)"
        }
        else {
            activityNum = "night\(data.count)"
        }
        
        data.setObject(activityInfo, forKey: activityNum)
        data.writeToFile(path, atomically: true)
        
        println(path)
        println(data)
        
        println("DAO -> saveActivity -> fim")
        
        return false // *** EM QUAL CASO RETORNARIA FALSE, E EM QUAL RETORNARIA TRUE? ***
    }
    
    class func updateActivity(oldActivity:Activity, newActivity:Activity)->Bool{
        
        println("DAO -> updateActivity -> inicio")
        
        var pathAux = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path: NSString = pathAux.stringByAppendingPathComponent("ActivityList.plist")
        var data: NSMutableDictionary! = NSMutableDictionary(contentsOfFile: path)

        var keys = data.allKeys
        var activityInfo: NSMutableDictionary!
        
        for(var i = 0; i < keys.count; i++) {
            var key = keys[i] as String

            activityInfo = data.valueForKey(key) as NSMutableDictionary
            var title = activityInfo.valueForKey("Title") as String
            var imageName = activityInfo.valueForKey("ImageName") as String
            var description = activityInfo.valueForKey("Description") as String
            
            if(title == oldActivity.title && imageName == oldActivity.imageName && description == oldActivity.description) {
                
                activityInfo = ["Title": newActivity.title, "ImageName": newActivity.imageName, "Description": newActivity.description]
                data.setObject(activityInfo, forKey: key)
                data.writeToFile(path, atomically: true)
                
                println(path)
                println(data)
                
                println("DAO -> updateActivity -> fim (achou)")
                return true
            }
            
        }
        
        
        println(path)
        println(data)
        println("DAO -> updateActivity -> fim (nao achou)")
        return false //Couldn't find the activity
    }
    
    class func deleteActivity(activity:Activity)->Bool {
        
        println("DAO -> deleteActivity -> inicio")
        
        var pathAux = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path: NSString = pathAux.stringByAppendingPathComponent("ActivityList.plist")
        var data: NSMutableDictionary! = NSMutableDictionary(contentsOfFile: path)
        
        var keys = data.allKeys
        var activityInfo: NSMutableDictionary!
        
        for(var i = 0; i < keys.count; i++) {
            var key = keys[i] as String
            
            activityInfo = data.valueForKey(key) as NSMutableDictionary
            var title = activityInfo.valueForKey("Title") as String
            var imageName = activityInfo.valueForKey("ImageName") as String
            var description = activityInfo.valueForKey("Description") as String
            
            if(title == activity.title && imageName == activity.imageName && description == activity.description) {
                
                data.removeObjectForKey(key)
                data.writeToFile(path, atomically: true)
                
                println(path)
                println(data)
                println("DAO -> deleteActivity -> fim (achou)")
                return true
            }
        }
        
        println(path)
        println(data)
        println("DAO -> deleteActivity -> fim (nao achou)")
        return false
    }
    
    class func getAllDateTime()->[DateTime]? {
        
        println("DAO -> getAllDateTime -> inicio")
        
        var morning = DateTime(name: "morning")
        var afternoon = DateTime(name: "afternoon")
        var night = DateTime(name: "night")
        var allDateTime = [DateTime]()
        var activityInfo: AnyObject?
        var currentActivity: Activity
        
        var pathAux = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var path: NSString = pathAux.stringByAppendingPathComponent("ActivityList.plist")
        let contents:NSDictionary! = NSDictionary(contentsOfFile: path)
        var keys = contents.allKeys
        
        if keys.count == 0 {

//           **** ESSA É A PARTE NOVA QUE DEVERIA ESTAR APARECENDO!!!!!! *****
            println("DAO -> getAllDateTime -> fim (não tinha nada para ler)")
            return [morning,afternoon,night]
        }
        
        for(var i = 0; i < keys.count; i++) {
            var key:String!
            key = keys[i] as String
            
            activityInfo = contents.valueForKey(key)
            
            let title = activityInfo?.valueForKey("Title") as String
            let imageName = activityInfo?.valueForKey("ImageName") as String
            currentActivity = Activity(title: title, imageName: imageName)
            currentActivity.description = activityInfo?.valueForKey("Description") as String
            
            if key.hasPrefix("morning") {
                morning.activities?.append(currentActivity)
            }
            else if key.hasPrefix("afternoon") {
                afternoon.activities?.append(currentActivity)
            }
            else {
                night.activities?.append(currentActivity)
            }
        }
        
        
        //        Fake data for testing
        //
        //
        //        var morningActivity = Activity(title: "Medicine", imageName: "medicine.png")
        //        morning.activities?.append(morningActivity)
        //
        //
        //        var afternoonActivity = Activity(title: "Study", imageName: "study.png")
        //        afternoon.activities?.append(afternoonActivity)
        //
        //
        //        var nightActivity = Activity(title: "Soccer", imageName: "soccer.png")
        //        night.activities?.append(nightActivity)
        
        var timeArray = [morning,afternoon,night]
        
        println(path)
        println(morning.activities?[0].title)

        println("DAO -> getAllDateTime -> fim")
        
        return timeArray
    }
    
}