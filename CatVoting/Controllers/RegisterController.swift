//
//  RegisterController.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 08.12.2021.
//

import UIKit
import Firebase

class RegisterController: UIViewController {

    @IBOutlet weak var loginRegField: UITextField!
    @IBOutlet weak var passwordRegField: UITextField!
    @IBOutlet weak var regButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    @objc
    func hideKeyboard() {
        loginRegField.endEditing(true)
        passwordRegField.endEditing(true)
        print(123)
    }
    
    private func configure() {
        loginRegField.backgroundColor = .systemOrange
        loginRegField.isOpaque = true
        loginRegField.layer.cornerRadius = 25.0
        loginRegField.clipsToBounds = true
        loginRegField.font = UIFont(name: "GillSans-SemiBold", size: 30.0)
        loginRegField.textColor = .white
        loginRegField.textAlignment = .center
        loginRegField.placeholder = "е-почта"
        loginRegField.textContentType = .emailAddress
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
        
    }

    @objc
    private func tapRegister(){
        guard let email = loginRegField.text,
              let password = passwordRegField.text
        else { return }
        Auth.auth().createUser(withEmail: email, password: password) {
            [weak self] authResult, error in
            guard let user = authResult?.user, error == nil else {
                self?.showAlert(title: "Ошибка", message: error!.localizedDescription, type: .alert, typeButton: .destructive)
                return
            }
            let alert = UIAlertController(title: "Зарегистрирован", message: "На адрес \(user.email!) направлено письмо о необходимости подтверждения регистрации", preferredStyle: .alert)
            let alertButton = UIAlertAction(title: "OK", style: .cancel) {_ in
                user.sendEmailVerification() { _ in
                    self?.dismiss(animated: true, completion: nil)
                }
            }
            alert.addAction(alertButton)
            self?.present(alert, animated: true)
        }
    }
    
    private func showAlert(title: String, message: String, type: UIAlertController.Style, typeButton: UIAlertAction.Style){
        let alert = UIAlertController(title: title, message: message, preferredStyle: type)
        let alertButton = UIAlertAction(title: "OK", style: typeButton)
        alert.addAction(alertButton)
        present(alert, animated: true)
    }
    

}
