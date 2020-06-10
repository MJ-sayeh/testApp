//
//  user.swift
//  MVCMVVM
//
//  Created by Macbook on 10/06/2020.
//  Copyright © 2020 Asal. All rights reserved.
//

import Foundation
struct Location:Codable{
    var lat:String
    var lng:String
}
struct Company:Codable{
    var name:String
    var catchPhrase:String
    var bs:String
}
struct Address:Codable {
    var street:String
    var suite:String
    var city:String
    var zipcode:String
    var geo:Location
}

struct User:Codable{
    var id:Int
    var name: String
    var username: String
    var email: String
    var phone: String
    var website:String
    var company: Company
    var address : Address
}




func getUsers(completion:@escaping ([User])->()){

   _ = API.getData(url: "https://jsonplaceholder.typicode.com/users"){ data in
        do {
            let users = try JSONDecoder().decode([User].self, from: data)
            completion(users)
        }catch {
     
        }
    }
}
