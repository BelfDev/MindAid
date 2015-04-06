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
    
    class func saveActivity(activity:Activity)->Bool{
        return false
    }
    
    class func updateActivity(activity:Activity)->Bool{
        return false
    }
    
    class func deleteActivity(activity:Activity)->Bool{
        return false
    }
    
    class func getAllDateTime()->[DateTime]?{
        
        
        //Fake data for testing
        var morning = DateTime(name: "Morning")
        var morningActivity = Activity(title: "MedTeste", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Soccerr", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
//
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        morningActivity = Activity(title: "Medicine", imageName: "btMed_20x20.png")
        morning.activities?.append(morningActivity)
        
        var afternoon = DateTime(name: "Afternoon")
        var afternoonActivity = Activity(title: "Study", imageName: "btBook_20.png")
        afternoon.activities?.append(afternoonActivity)
        afternoonActivity = Activity(title: "Study", imageName: "btBook_20.png")
        afternoon.activities?.append(afternoonActivity)
        
        var night = DateTime(name: "Night")
        var nightActivity = Activity(title: "Teste", imageName: "medicine.png")
        night.activities?.append(nightActivity)
        nightActivity = Activity(title: "Teste22", imageName: "soccer.png")
        night.activities?.append(nightActivity)
        
        var timeArray = [morning,afternoon,night]
        
        return timeArray
    }
    
}


