//
//  ListModelView.swift
//  MVCMVVM
//
//  Created by Macbook on 10/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import Foundation
class ListModelView{
    var data = [User]()
    var selectedUser : User?
    weak var delegate: ListModelViewDelegate?
    func getData(){
        getUsers { [weak self] (users) in
            DispatchQueue.main.async {
                self?.data = users
                self?.notifyDelegates()
                
            }
        }
    }
    func notifyDelegates(){
            delegate?.onDataUpdate()
    }
    func deleteUserAt(_ index:Int){
        data.remove(at: index)
        delegate?.onRowDeleted(index)
    }
    func addRow(user:User){
        data.append(user)
        delegate?.onRowAdded(data.count)
    }
 
  

}
protocol ListModelViewDelegate:class{
    func onDataUpdate()
    func onRowDeleted(_ index:Int)
    func onRowAdded(_ index:Int)
}
