//
//  UserTableViewCell.swift
//  MVCMVVM
//
//  Created by Macbook on 10/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userDescription: UILabel!
    @IBOutlet weak var optionalDescription: UILabel!
    
    @IBOutlet weak var optionalHeight: NSLayoutConstraint!
    var user:User!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUser(_ user:User,showBottom:Bool){
        self.user = user
        
        name.text = user.name
        userDescription.text = user.website
       
        if(showBottom){
            optionalHeight.constant = 30
             optionalDescription.text = user.company.catchPhrase
        }else{
            optionalHeight.constant = 0
             optionalDescription.text = ""
        }
        contentView.layoutIfNeeded()
    }
    

}
