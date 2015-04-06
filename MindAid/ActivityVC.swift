//
//  ActivityVC.swift
//  MindAid
//
//  Created by Pedro Henrique Belfort Fernandes on 3/26/15.
//  Copyright (c) 2015 Pedro Belfort. All rights reserved.
//

import UIKit

let textCellIdentifier = "titleInputCell"
// Belfort
class ActivityVC: UIViewController,UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate {

    //Declarations
    //var currentActivity = Activity()
    
    @IBOutlet weak var firstTableView: UITableView!
    
    //Setting up ActivityViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        //firstTableView.delegate = self
        //firstTableView.dataSource = self
        
        //Abaixo segue o resgistro que utlizaremos para celulas custom
        /*self.firstTableView.registerClass(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: textCellIdentifier)
        self.firstTableView.dataSource = self*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Setting up firstTableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 1
    }
    @IBAction func done(sender: AnyObject) {
       //TODO
        var newActivity = Activity(title: "XPTO", imageName: "xpto.png")
        
        newActivity.description = "LA LA LA"
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell = self.firstTableView.dequeueReusableCellWithIdentifier(textCellIdentifier) as TitleTableViewCell
        
        cell.textField.delegate = self
        cell.configure(text: "", placeholder: "Title")
        //currentActivity.title = cell.textField.text
        //println(currentActivity.title)
        
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    //Make the keyboard disappear when press return
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func getPosition(secaoNum:Int, posItem:Int){
        println(" secao:\(secaoNum) pos do Item: \(posItem)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
