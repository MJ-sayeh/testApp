//
//  ListModelView.swift
//  MVCMVVM
//
//  Created by Macbook on 10/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import Foundation
class GridModelView{
    var data = [Image]()
    var delegate : GridModelViewDelegate?
    func getData(){
        getImages { [weak self] (images) in
            DispatchQueue.main.async {
                self?.data = images
                self?.notifyDelegates()
                
            }
        }
    }
    func notifyDelegates(){
        delegate?.onDataUpdate()
    }
}
protocol GridModelViewDelegate:class{
    func onDataUpdate()
}
