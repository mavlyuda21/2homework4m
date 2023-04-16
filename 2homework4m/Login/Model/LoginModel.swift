//
//  LoginModel.swift
//  2homework4m
//
//  Created by mavluda on 15/4/23.
//

import Foundation

struct User{
    var email, password: String
}

class LoginModel{
    private weak var controller: LoginController!
    
    let usersManager = UsersManager()
    
    var users = [User]()
    
    init(controller: LoginController!) {
        self.controller = controller
    }
    
    func getUsers(){
    usersManager.getUsers(completion: { users in
        self.users = users
        })
    }
    
    func checkUser(model: User) -> Bool{
        var result = false
        for i in users{
            if i.email == model.email{
                if i.password == model.password{
                    result = true
                }
            }
        }
        return result
    }
    
}
