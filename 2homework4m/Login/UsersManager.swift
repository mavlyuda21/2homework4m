//
//  UsersManager.swift
//  2homework4m
//
//  Created by mavluda on 15/4/23.
//

import Foundation

class UsersManager{
    
    func getUsers(completion: ([User]) -> ()){
        completion([User(email: "nursultan@gmail.com", password: "natlusrun"),User(email: "mavlyuda@gmail.com", password: "mavlyuda21")])
    }
    
}
