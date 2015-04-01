//
//  ViewController.swift
//  MindAid
//
//  Created by Pedro Henrique Belfort Fernandes on 3/26/15.
//  Copyright (c) 2015 Pedro Belfort. All rights reserved.
//

import UIKit
// Gabriel
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var qtdTarefas:Int=0;
    //var tableData:[String] = [ "aplle", "maca", "pera"]
    
    override func viewDidLoad()
    {
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
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 3;
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        // return tableData.count
        
        
        
        return Data.sharedInstance.morningTime.activities!.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:CollectionOfActivity = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as CollectionOfActivity
        
        var activity:Activity!
        
        if (indexPath.section == 0)
        {
            activity = Data.sharedInstance.morningTime.activities![indexPath.row]
        }
        else if (indexPath.section == 1)
        {
            activity = Data.sharedInstance.afternoonTime.activities![indexPath.row]
        }
        else
        {
            activity = Data.sharedInstance.nightTime.activities![indexPath.row]
        }
        
        
        
        //var image:UIImage(name)
        
        cell.labelCell.text = activity.title
        
        cell.imgCell.image = UIImage(named:activity.imageName)
        //cell.labelCell.text = tableData[indexPath.row]
        
        // cell.labelCell.text = Data.sharedInstance.morningTime.activitie
        // cell.labelCell.text =
        
        
        return cell
        
    }
    
    //    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
    //        println("Cell \(indexPath.row) selector")
    //    }
    
    
    //funcao que identifica qual tarefa foi selecionada
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        println("Cell \(indexPath.row) selector")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

