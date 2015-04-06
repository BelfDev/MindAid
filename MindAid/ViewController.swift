//
//  ViewController.swift
//  MindAid
//
//  Created by Pedro Henrique Belfort Fernandes on 3/26/15.
//  Copyright (c) 2015 Pedro Belfort. All rights reserved.
//

import UIKit
// Gabriel
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var activityCollectionView: UICollectionView!
    
    
    var qtdTarefas:Int=0;
    //var tableData:[String] = [ "aplle", "maca", "pera"]
    
    //var deletaCelula: Bool = false
    
    
    
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
        
        
        if(section == 0){
            
            println("Secao 0")
            return Data.sharedInstance.morningTime.activities!.count
            
        }
            
        else if (section == 1 ){
            println("Secao 1")
            return Data.sharedInstance.afternoonTime.activities!.count
            
        }
            
            
        else {
            println("Secao 2")
            return Data.sharedInstance.nightTime.activities!.count
            
        }
        
        
    }
    
    
    //cria as celulas nas secoes
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //era let coloquei var
        var cell:CollectionOfActivity = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as CollectionOfActivity
        
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
        
        
        cell.labelCell.text = activity.title
        
        cell.imgCell.image = UIImage(named:activity.imageName)
        
        var gestureLong = UILongPressGestureRecognizer(target: self, action: Selector("deleteHoldGesture:"))
        
        gestureLong.delaysTouchesBegan = true
        
        gestureLong.minimumPressDuration = 0.5
        
        cell.addGestureRecognizer(gestureLong)
        
        //***********ALTERAR TAMANHO DA CELULA DE ACORDO COM O TAMANHO DA tela
        
        return cell
        
    }
    
    
    
    
    //funcao que identifica qual tarefa foi selecionada e retorna um array de secao [0] selecionada e tarefa [1] dentro da secao
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        //var posicaoDoItem:[Int]!
        
        //println("Cell \(indexPath.row) selector")
        
        
        //        println("Cell \(indexPath.section) section")
        //        println("Cell \(indexPath.item) selector")
        //posicaoDoItem[0] = indexPath.section
        //posicaoDoItem[1] = indexPath.item
        var vc = ActivityVC()
        vc.getPosition(indexPath.section, posItem: indexPath.item)
        self.presentViewController(vc, animated: true, completion: nil)
        
        
    }
    
    @IBAction func deleteHoldGesture(sender: UILongPressGestureRecognizer) {
        
        // println(" antes \(deletaCelula)")
        // deletaCelula = true;
        println(" Holdd")
        var celula = sender.view as CollectionOfActivity
        println(celula)
        
        
        
        println("label celula: \(celula.labelCell.text)")
        
        // Data.sharedInstance.morningTime.activities!.removeAtIndex(0)
        
        if(DAO.getAllDateTime()!.count > 1 && Data.sharedInstance.morningTime.activities!.count>1){
            println(DAO.getAllDateTime()?.count)
            
            Data.sharedInstance.morningTime.activities!.removeAtIndex(celula.tag)
            DAO.deleteActivity(Data.sharedInstance.morningTime.activities!.removeAtIndex(0))
            activityCollectionView.reloadData()
        }
        //celula.delete(self)
        
        //activityCollectionView.delete(celula)
        //activityCollectionView.delete(celula)
        
        //        activityCollectionView.
        //
        //activityCollectionView.deleteItemsAtIndexPaths(IndexPath)
        
        //        CGPoint p = [gestureRecognizer locationInView:self.collectionView];
        //
        //        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
        //        if (indexPath == nil){
        //            NSLog(@"couldn't find index path");
        //        } else {
        //            // get the cell at indexPath (the one you long pressed)
        //            UICollectionViewCell* cell =
        //                [self.collectionView cellForItemAtIndexPath:indexPath];
        //            // do stuff with the cell
        //        }
        
        
        
    }
    
    
    
    
    
    
    
    //    func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject!) -> Bool {
    //
    //sender. as UICollectionViewCell
    //
    //
    //        if( == sender.tag("gabriel")){
    //        indexPath.delete(indexPath.item)
    //        }
    //
    //    }
    
    
    
    //     func collectionView(collectionView: UICollectionView,
    //        layout collectionViewLayout: UICollectionViewLayout,
    //        minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
    //
    //            return 100.0
    //
    //
    //    }
    
    //determina o tamanho da celula
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(50, 70);
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5.0
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        
        //condicionais para determinar a quantidade de tarefas
        //top, left, bottom, right
        if(section == 0){
            if(Data.sharedInstance.morningTime.activities!.count <= 4)
            {
                return UIEdgeInsetsMake(30, 0, 0, 0)
            }
            else {
                return UIEdgeInsetsMake(30, 0, 30, 0)
            }
        }
            
        else if(section == 1){
            
            if(Data.sharedInstance.afternoonTime.activities!.count <= 4)
            {
                return UIEdgeInsetsMake(30, 0, 0, 0)
            }
            else {
                return UIEdgeInsetsMake(30, 0, 30, 0)
            }
        }
        else {
            if(Data.sharedInstance.nightTime.activities!.count <= 4)
            {
                return UIEdgeInsetsMake(30, 0, 0, 0)
            }
            else {
                return UIEdgeInsetsMake(30, 0, 30, 0)
            }
            
        }
    }
    
    
    //    func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer){
    //        if (gestureRecognizer.state != UIGestureRecognizerState.Ended){
    //            return
    //        }
    //
    //        let p: CGPoint = gestureRecognizer.locationInView(self.collectionView)
    //        let indexPath: NSIndexPath = self.collectionView.indexPathForItemAtPoint(p)!
    //        if (indexPath == nil) {      // Error here 'NSIndexPath' is not convertible to 'UIGestureRecognizerState'
    //            println("couldn't find index path")
    //
    //        } else {
    //            let cell: UICollectionViewCell = self.collectionView.cellForItemAtIndexPath(indexPath)
    //        }
    //    }
    
    //    @IBAction func DeleteGesture(sender: UILongPressGestureRecognizer) {
    //        println("reconheceu o gesto")
    //        sender.view?.contentMode == UIView.
    //        //sender.delete(UICollectionViewUpdateItem)
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //codigo para atualizar a collection quando for para a tela do pedro
    //    override func viewWillAppear
    //    {
    //    super viewWillAppear:animated];
    //    self.collectionView reloadData];
    //    }
    //    override func viewWillAppear(animated: Bool) {
    //        super.viewWillAppear(false);
    //        self.collectionView.reloadData
    //    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(false)
        activityCollectionView.reloadData()
        
    }
    
    
}

