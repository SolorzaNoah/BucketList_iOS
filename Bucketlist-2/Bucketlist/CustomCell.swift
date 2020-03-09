//
//  CustomCell.swift
//  Bucketlist
//
//  Created by student on 03/06/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

protocol CustomCellProtocol:class {
    func checkBoxTapped(indexPath:IndexPath,isChecked:Bool)
}

class CustomCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    weak var delegate:CustomCellProtocol?
    @IBOutlet weak var buttonImage: UIButton!
    var indexPath:IndexPath!
    var isChecked:Bool!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    @IBAction func buttonImageTapped(_ sender: Any) {
           
        if isChecked == true{
            return
        }
        self.delegate?.checkBoxTapped(indexPath: indexPath, isChecked: !isChecked)
    }
    
}
