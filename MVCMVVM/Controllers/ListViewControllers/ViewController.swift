//
//  ViewController.swift
//  MVCMVVM
//
//  Created by Macbook on 08/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var data = [User]()
    var selectedUser : User?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getUsers { [weak self] (users) in
            DispatchQueue.main.async {
                self?.data = users
                self?.tableView.reloadData()
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? UserViewController{
            destinationViewController.user = selectedUser
        }
    }

}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        let user = data[indexPath.row]
        cell.setUser(user, showBottom: indexPath.row % 2 == 0)
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = data[indexPath.row]
        tableView.cellForRow(at: indexPath)?.isSelected = false
        
        performSegue(withIdentifier: "toUser", sender: nil)
    }
    


}
