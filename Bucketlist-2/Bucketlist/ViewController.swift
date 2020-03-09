//
//  ViewController.swift
//  Bucketlist
//
//  Created by student on 3/6/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol:class{
    func saveButtonTapped(indexPath:IndexPath,subject:String,description:String,latitude:String,longitude:String)
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var descriptionTV: UITextView!
    
    @IBOutlet weak var latitude: UITextField!
    
    @IBOutlet weak var longitude: UITextField!
    
    var text: String = ""
    var indexPath:IndexPath!
    var model:Model!
    weak var delegate:ViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
    }
    
    func initialise(){
        
        self.textField.text = model.name
        self.descriptionTV.text = model.description
        self.latitude.text = model.latitude
        self.longitude.text = model.longitude
    }

    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        // we need to save the data to the previous cell.
        self.delegate?.saveButtonTapped(indexPath: indexPath, subject: textField.text!,description:descriptionTV.text,latitude:latitude.text!,longitude:longitude.text!)
        self.navigationController?.popViewController(animated: true)
    }
    

}


