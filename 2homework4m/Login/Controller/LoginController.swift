//
//  LoginController.swift
//  2homework4m
//
//  Created by mavluda on 15/4/23.
//

import Foundation

class LoginController{
    private weak var view: LoginView!
    private var model: LoginModel?
    
    init(view: LoginView) {
        self.view = view
        self.model = LoginModel(controller: self)
    }
    
    func getUsers() -> [User]{
        return model!.users
    }
    
    func getData(){
        model?.getUsers()
    }
    
    func checkUser(login: String, password: String){
        if model?.checkUser(model: User(email: login, password: password)) == false{
            view.appearErrorAlert()
        }else{
            view.appearDoneAlert()
        }
    }
    
}
