//
//  TableViewController.swift
//  Bucketlist
//
//  Created by student on 3/6/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var data:[Model] = []
    
    var currentItem: String = ""

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        self.title = "BucketList"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    func fillData(){
        let  model = Model(name: "Backetball", isChecked: false, longitude: "444,67E", latitude: "455.5N", description: "I want to play basketBall")
        self.data.append(model)
       let model1 = Model(name: "Soccer", isChecked: false, longitude: "3234.5S", latitude: "3555.63E", description: "I want to play soccer")
        self.data.append(model1)
        
        let model2 = Model(name: "Football", isChecked: false, longitude: "33567.67N", latitude: "4346.788E", description: "I want to play footbar")
        self.data.append(model2)
        
    }
    
//    @IBAction func checkBox(_ sender: Any) {
//        let button = UIButton()
//        button.backgroundColor = UIColor.red
//    }
    
    
    @IBAction func addbuttonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        // this line will allow the tableViewController to respond to the messages passed bt the AddViewController
        controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        let model = self.data[indexPath.row]
        
        cell.label.text = model.name
        cell.delegate = self
        cell.indexPath = indexPath
        cell.isChecked = model.isChecked
        if model.isChecked == false{
            cell.buttonImage.setImage(UIImage(named:"uncheck"), for: .normal)
        }else{
            cell.buttonImage.setImage(UIImage(named: "check"), for: .normal)
        }
        
        return cell
    }
    
    

    // Override to support conditional editing of the table view.
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
     func tableView(_ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
 
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        controller.indexPath = indexPath
        controller.delegate = self
        controller.model = self.data[indexPath.row]
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
   


}


extension TableViewController:ViewControllerProtocol{
    
    
    func saveButtonTapped(indexPath: IndexPath, subject: String,description:String,latitude:String,longitude:String) {
        self.data[indexPath.row].name = subject
        self.data[indexPath.row].description = description
        self.data[indexPath.row].latitude = latitude
        self.data[indexPath.row].longitude = longitude
        self.tableView.reloadData()
    }
    
    
    
    
    
}

extension TableViewController:AddViewControllerProtocol{
    
    func addButtonTapped(name: String, description: String, latitude: String, longitude: String) {
        let model = Model(name: name, isChecked: false, longitude: longitude, latitude: latitude, description: description)
        self.data.append(model)
        // higher order functions in swift
        self.data.sort { (model1, model2) -> Bool in
            return  model1.isChecked == false
               }
        self.tableView.reloadData()
    }
    
    
}

extension TableViewController:CustomCellProtocol{
    func checkBoxTapped(indexPath: IndexPath, isChecked: Bool) {
        self.data[indexPath.row].isChecked = isChecked
        self.data.sort { (model1, model2) -> Bool in
            return  model1.isChecked == false
        }
        self.tableView.reloadData()
    }
    
    
}
