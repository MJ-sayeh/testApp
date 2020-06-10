//
//  images.swift
//  MVCMVVM
//
//  Created by Macbook on 10/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import Foundation
import UIKit
struct Image:Codable{
    var albumId : Int
    var id : Int
    var title : String
    var url : String
    var thumbnailUrl : String
    
      func getThumbnail(completion:@escaping(UIImage)->())->URLSessionDataTask{
         return API.getData(url: thumbnailUrl) { (data) in
              if let image = UIImage(data: data){
                   completion(image)
              }
          }
      }
    
      func getImage(completion:@escaping(UIImage)->())->URLSessionDataTask{
          return API.getData(url: url) { (data) in
              if let image = UIImage(data: data){
                   completion(image)
              }
          }
      }
}


func getImages(completion:@escaping ([Image])->()){
    
   _ = API.getData(url: "https://jsonplaceholder.typicode.com/photos"){ data in
        do {
            let images = try JSONDecoder().decode([Image].self, from: data)
            completion(images)
        }catch {
     
        }
    }
}

