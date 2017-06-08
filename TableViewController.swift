//
//  TableViewController.swift
//  SwipeDeleteBug
//
//  Created by Jason Ji on 6/7/17.
//  Copyright © 2017 Jason Ji. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var model: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        print("setEditing")
        super.setEditing(editing, animated: animated)
        
        // Works but crash on iOS 11 when swipe-to-delete:
        tableView.beginUpdates()
        tableView.endUpdates()
        
        // Doesn't work:
//        tableView.layoutIfNeeded()
//        tableView.setNeedsLayout()
    }
    
    @IBAction func addTapped(_ sender: Any) {
        model.append("A really long sentence that is supposed to demonstrate self-sizing when setting editing on a table view. This is another long sentence. Should take a couple lines. Maybe one more.")
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GrowingTableViewCell
        cell.label.text = model[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("commitEditingStyle")
        if editingStyle == .delete {
            model.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print("done commiting...?")
        }
    }
    
    override func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        // no-op
    }
}
