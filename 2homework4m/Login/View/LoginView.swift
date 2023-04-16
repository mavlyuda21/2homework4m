//
//  LoginView.swift
//  2homework4m
//
//  Created by mavluda on 15/4/23.
//

import Foundation
import SnapKit

class LoginView: UIViewController{
    
    private var controller: LoginController!
    
    private lazy var emailField: UITextField = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        return view
    }()
    
    private lazy var passwordField: UITextField = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 14, weight: .bold)
        view.placeholder = "PASSWORD"
        view.tintColor = .systemGray2
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        return view
    }()
    
    private lazy var loginButton: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        view.setTitleColor(.white, for: .normal)
        view.setTitle("LOGIN  ", for: .normal)
        view.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        view.tintColor = .white
        view.semanticContentAttribute = .forceRightToLeft
        view.layer.cornerRadius = 20
        view.backgroundColor = .orange
        view.clipsToBounds = false
        view.addTarget(self, action: #selector(loginTapped(view:)), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller = LoginController(view: self)
        
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .white
        setupSubviews()
        
        controller.getData()
    }
    
    private func setupSubviews(){
        let loginLabel: UILabel = {
            let view = UILabel()
            view.text = "Login"
            view.font = .systemFont(ofSize: 32, weight: .bold)
            return view
        }()
        
        view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview().offset(32)
        }
        
        let signInLabel: UILabel = {
            let view = UILabel()
            view.text = "Please sign in to continue"
            view.font = .systemFont(ofSize: 22, weight: .semibold)
            view.textColor = .systemGray2
            return view
        }()
        
        view.addSubview(signInLabel)
        signInLabel.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(6)
            make.leading.equalTo(loginLabel).offset(5)
        }
        
        let emailView: UIView = {
            let view = UIView()
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOffset = CGSize(width: 5, height: 5)
            view.layer.shadowRadius = 10
            view.layer.shadowOpacity = 0.1
            view.layer.masksToBounds = false
            view.clipsToBounds = false
            view.backgroundColor = .white
            return view
        }()
        
        view.addSubview(emailView)
        emailView.snp.makeConstraints { make in
            make.top.equalTo(signInLabel.snp.bottom).offset(50)
            make.leading.equalTo(loginLabel).offset(5)
            make.height.equalTo(70)
            make.trailing.equalToSuperview().offset(-32)
        }
        
        lazy var emailLabel: UILabel = {
            let view = UILabel()
            view.text = "EMAIL"
            view.font = .systemFont(ofSize: 16, weight: .semibold)
            view.textColor = .systemGray2
            return view
        }()
        
        emailView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(40)
        }
        
        let emailImage: UIImageView = {
            let view = UIImageView(image: UIImage(systemName: "envelope"))
            view.tintColor = .black
            return view
        }()
        
        emailView.addSubview(emailImage)
        emailImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(12)
            make.width.equalTo(24)
            make.height.equalTo(20)
        }
        
        emailView.addSubview(emailField)
        emailField.snp.makeConstraints { make in
            make.centerY.equalTo(emailImage)
            make.leading.equalTo(emailLabel)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        let passwordImage: UIImageView = {
            let view = UIImageView(image: UIImage(systemName: "lock"))
            view.tintColor = .black
            return view
        }()
        
        view.addSubview(passwordImage)
        passwordImage.snp.makeConstraints { make in
            make.top.equalTo(emailView.snp.bottom).offset(40)
            make.leading.equalTo(emailImage)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.centerY.equalTo(passwordImage)
            make.leading.equalTo(emailField)
            make.trailing.equalTo(emailField).offset(-50)
        }
        
        let forgotButton: UIButton = {
            let view = UIButton(type: .system)
            view.setTitleColor(.orange, for: .normal)
            view.setTitle("FORGOT", for: .normal)
            view.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
            return view
        }()
        
        view.addSubview(forgotButton)
        forgotButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordField)
            make.leading.equalTo(passwordField.snp.trailing)
            make.trailing.equalTo(emailView)
            make.height.equalTo(24)
        }
        
        let separatorView = UIView()
        separatorView.backgroundColor = .systemGray3
        
        view.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.trailing.equalTo(emailView)
            make.top.equalTo(passwordField.snp.bottom).offset(8)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(30)
            make.trailing.equalTo(emailView)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        let dontHaveLabel: UILabel = {
            let view = UILabel()
            view.text = "Don't have an account?"
            view.font = .systemFont(ofSize: 16, weight: .semibold)
            view.textColor = .systemGray2
            return view
        }()
        
        view.addSubview(dontHaveLabel)
        dontHaveLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-30)
            make.leading.equalToSuperview().offset(60)
        }
        
        let dontHaveButton: UIButton = {
            let view = UIButton(type: .system)
            view.setTitleColor(.orange, for: .normal)
            view.setTitle("Sign up", for: .normal)
            view.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            return view
        }()
        
        view.addSubview(dontHaveButton)
        dontHaveButton.snp.makeConstraints { make in
            make.leading.equalTo(dontHaveLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-60)
            make.height.equalTo(20)
            make.centerY.equalTo(dontHaveLabel)
        }
    }
    
    @objc func loginTapped(view: UIButton){
        controller.checkUser(login: emailField.text ?? "", password: passwordField.text ?? "")
    }
    
    func appearErrorAlert(){
        let alert =  UIAlertController(title: "Incorrect password", message: "Please try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func appearDoneAlert(){
        let alert =  UIAlertController(title: "Authorized Successfully", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
}
