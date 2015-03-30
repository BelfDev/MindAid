//
//  TitleTableViewCell.swift
//  MindAid
//
//  Created by Pedro Henrique Belfort Fernandes on 3/28/15.
//  Copyright (c) 2015 Pedro Belfort. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    //Declaration
    @IBOutlet weak var textField: UITextField!
    
    //Default TableViewCell methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //Custom textField methods
    func configure(#text: String?, placeholder: String) {
        textField.text = text
        textField.placeholder = placeholder
        
        textField.accessibilityValue = text
        textField.accessibilityLabel = placeholder
    }


}
