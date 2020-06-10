//
//  ImageCollectionViewCell.swift
//  MVCMVVM
//
//  Created by Macbook on 10/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    var image: Image!
    var request: URLSessionDataTask!
    
    func setImage(_ image: Image){
        self.image = image
        self.imageView.image = nil
        if let request = self.request{
            request.cancel()
        }
        request = self.image.getThumbnail(completion: { [weak self](uiImage) in
            DispatchQueue.main.async {
                self?.imageView.image = uiImage
                self?.request = nil
            }
            
            
        })
    }
}
