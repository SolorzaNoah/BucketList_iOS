//
//  ViewController.swift
//  Test
//
//  Created by Jonathan Ninan on 2/25/20.
//  Copyright © 2020 Jonathan Ninan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MyTableView: UITableView!
    
    var data = ["Basketball", "Soccer", "Football", "Volleyball", "Jogging", "Basketball", "Rockclimbing", "Videogame", "Scienceproject"]
    override func viewDidLoad() {
        super.viewDidLoad()
        MyTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    @IBAction func FloatingActionButton(_ sender: Any) {
        newItem()
    }
    
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> UITableViewRowAction {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
    }*/
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.data.remove(at: indexPath.row)
            self.MyTableView.reloadData()
        }
    }
    /*func tableView(_ tableView: UITableView, leadingSwipeActionConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit")
        { (contextualAction, view, actionPerformed: (Bool) -> ()) in
        }
        return UISwipeActionsConfiguration(actions: [edit])
    }*/
    
    /*func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let modifyAction = UIContextualAction(style: .normal, title:  "Update", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Update action ...")
            success(true)
        })
        modifyAction.image = UIImage(named: "hammer")
        modifyAction.backgroundColor = .blue
    
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }*/

    func newItem(){
        data.append("Hockey")
        
        MyTableView.beginUpdates()
        MyTableView.insertRows(at: [IndexPath(row: data.count-1, section: 0)], with: .automatic)
        MyTableView.endUpdates()
        
        
    }
    
    
}
