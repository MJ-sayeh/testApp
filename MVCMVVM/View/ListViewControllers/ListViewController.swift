//
//  ViewController.swift
//  MVCMVVM
//
//  Created by Macbook on 08/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var modelView = ListModelView()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        modelView.delegate = self
        modelView.getData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? UserViewController{
            destinationViewController.user = modelView.selectedUser
        }
    }

}

extension ListViewController: UITableViewDataSource,UITableViewDelegate,ListModelViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelView.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        let user = modelView.data[indexPath.row]
        cell.setUser(user, showBottom: indexPath.row % 2 == 0)
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        modelView.selectedUser = modelView.data[indexPath.row]
        tableView.cellForRow(at: indexPath)?.isSelected = false
        performSegue(withIdentifier: "toUser", sender: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            modelView.deleteUserAt(indexPath.row)
            
        }
    }
    func onDataUpdate() {
        tableView.reloadData()
    }
    func onRowAdded(_ index: Int) {
        tableView.insertRows(at: [IndexPath(item: index, section: 0)], with: .automatic)
    }
    func onRowDeleted(_ index: Int) {
        tableView.deleteRows(at: [IndexPath(item: index, section: 0)], with: .automatic)// to preserve animation
    }

}
