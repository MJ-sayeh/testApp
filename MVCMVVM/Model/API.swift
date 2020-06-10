//
//  API.swift
//  MVCMVVM
//
//  Created by Macbook on 10/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import Foundation
class API{
    //most of the stuff here will be callbacks and stuff
    
    static func getData(url:String,completion:@escaping(Data)->())->URLSessionDataTask{
        let url = URL(string: url)!
      let ses =  URLSession.shared.dataTask(with: url) { data, res, err in
            if let error = err as? NSError{
                if error.code !=  NSURLErrorCancelled{
                         print(error.localizedDescription)
                }else{
                    print("helllooo")
                }
           
                return
            }
            if let data = data{
                completion(data)
            }
        }
      ses.resume()
        return ses
}

}
