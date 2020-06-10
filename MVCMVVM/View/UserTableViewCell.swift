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
    
    @IBOutlet weak var stackView: UIStackView!
 
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
        optionalDescription.text = user.phone
        if(showBottom){
            if(!stackView.subviews.contains(optionalDescription)){
                stackView.insertArrangedSubview(optionalDescription, at: stackView.subviews.count)
                optionalDescription.isHidden = false
            }
        }else{
            if(stackView.subviews.contains(optionalDescription)){
                stackView.removeArrangedSubview(optionalDescription)
                optionalDescription.isHidden = true
            }
        }
        contentView.layoutIfNeeded()
    }
    
    
}
