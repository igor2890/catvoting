//
//  RegisterController.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 08.12.2021.
//

import UIKit
import Firebase
import KeychainSwift

class RegisterViewController: UIViewController, RegisterViewControllerProtocol {

    @IBOutlet weak var loginRegField: UITextField!
    @IBOutlet weak var passwordRegField: UITextField!
    @IBOutlet weak var regButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    let configurator: RegisterConfiguratorProtocol = RegisterConfigurator()
    var presenter: RegisterPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        configureSubViews()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    @objc
    func hideKeyboard() {
        loginRegField.endEditing(true)
        passwordRegField.endEditing(true)
    }
    
    private func configureSubViews() {
        loginRegField.backgroundColor = .systemOrange
        loginRegField.isOpaque = true
        loginRegField.layer.cornerRadius = 25.0
        loginRegField.clipsToBounds = true
        loginRegField.font = UIFont(name: "GillSans-SemiBold", size: 30.0)
        loginRegField.textColor = .white
        loginRegField.textAlignment = .center
        loginRegField.placeholder = "е-почта"
        loginRegField.textContentType = .username
        loginRegField.keyboardType = .emailAddress
        loginRegField.autocorrectionType = .no
        loginRegField.clearButtonMode = .always
        
        
        passwordRegField.backgroundColor = .systemOrange
        passwordRegField.isOpaque = true
        passwordRegField.layer.cornerRadius = 25.0
        passwordRegField.clipsToBounds = true
        passwordRegField.font = UIFont(name: "GillSans-SemiBold", size: 30.0)
        passwordRegField.textColor = .white
        passwordRegField.textAlignment = .center
        passwordRegField.placeholder = "пароль"
        passwordRegField.textContentType = .password
        passwordRegField.autocorrectionType = .no
        passwordRegField.isSecureTextEntry = true
        passwordRegField.clearButtonMode = .always
        
        regButton.setTitle("Зарегистрироваться", for: [])
        regButton.tintColor = .systemGray
        regButton.titleLabel?.font = UIFont(name: "GillSans-SemiBold", size: 18.0)
        regButton.addTarget(nil, action: #selector(tapRegister), for: .touchUpInside)
        
        closeButton.setTitle("Закрыть", for: [])
        closeButton.tintColor = .systemRed
        closeButton.titleLabel?.font = UIFont(name: "GillSans-SemiBold", size: 14.0)
        closeButton.addTarget(nil, action: #selector(tapClose), for: .touchUpInside)
    }


    
    //MARK: RegisterViewControllerProtocol
    
    @objc
    private func tapRegister(){
        presenter.registerTapped(
            email: loginRegField.text,
            password: passwordRegField.text)
    }
    
    @objc
    private func tapClose(){
        loginRegField.text = ""
        passwordRegField.text = ""
        presenter.needCloseView()
    }
    
    func showOKAlert(
        title: String,
        message: String){
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let alertButton = UIAlertAction(title: "OK", style: .default)
            alert.addAction(alertButton)
            present(alert, animated: true)
    }
    
    func closeSelf() {
        dismiss(animated: true, completion: nil)
    }
}

