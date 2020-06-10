//
//  UserViewController.swift
//  MVCMVVM
//
//  Created by Macbook on 10/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    var user: User!
    @IBOutlet weak var userLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = user.address.geo.lat
        // Do any additional setup after loading the view.
    }
    



}
