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
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //No prepareForSegue você vai ter que distinguir cada situação para posicionar a tarefa criada na região "certa". Para a tela de consulta, vou precisar que você me passe os dados de referência da atividade selecionada para então carregar as infomrações no ActivitiVC
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "morningSegue"
        {
            let vc = segue.destinationViewController as ActivityVC
            vc.dayTime = "morning"
            
        }
        else if segue.identifier == "afternoonSegue"
        {
            let vc = segue.destinationViewController as ActivityVC
            vc.dayTime = "afternoon"
        }
        else
        {
            let vc = segue.destinationViewController as ActivityVC
            vc.dayTime = "night"
            
        }
        
    }


}

