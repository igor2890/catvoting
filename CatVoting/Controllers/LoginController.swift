//
//  LoginController.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 05.12.2021.
//

import UIKit
import Firebase
import KeychainSwift

class LoginController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButtonImage: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    private let gUsername = "1"
    private let gPassword = "1"
    private let keychain = KeychainSwift()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubViews()
        scrollView.addGestureRecognizer(UITapGestureRecognizer(
                                            target: self,
                                            action: #selector(hideKeyboard)))
    }
    
    @objc
    func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    @objc
    func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue)
            .cgRectValue
            .size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .required
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .defaultHigh
            self.view.layoutIfNeeded()
        }
    }
    
    @objc
    func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .defaultHigh
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .required
            self.view.layoutIfNeeded()
        }
    }

    private func configureSubViews() {
        mainImageView.image = UIImage(named: "mainImage")
        
        mainLabel.text = "ДЛЯ ТЕХ, КТО\nХОЧЕТ ПРАВИТЬ\nМИРОМ И ХОЗЯИНОМ"
        mainLabel.font = UIFont(name: "GillSans-SemiBold", size: 27.0)
        mainLabel.textColor = grayCatColor
        
        loginField.backgroundColor = orangeCatColor
        loginField.isOpaque = true
        loginField.layer.cornerRadius = 25.0
        loginField.clipsToBounds = true
        loginField.font = UIFont(name: "GillSans-SemiBold", size: 30.0)
        loginField.textColor = .white
        loginField.textAlignment = .center
        loginField.placeholder = "е-почта"
        loginField.textContentType = .username
        loginField.keyboardType = .emailAddress
        loginField.autocorrectionType = .no
        loginField.clearButtonMode = .always
        
        keychain.synchronizable = true
        let login = keychain.get("emailLogin")
        if login != nil {
            loginField.text = login
        }
        
        
        passwordField.backgroundColor = orangeCatColor
        passwordField.isOpaque = true
        passwordField.layer.cornerRadius = 25.0
        passwordField.clipsToBounds = true
        passwordField.font = UIFont(name: "GillSans-SemiBold", size: 30.0)
        passwordField.textColor = .white
        passwordField.textAlignment = .center
        passwordField.placeholder = "пароль"
        passwordField.textContentType = .password
        passwordField.autocorrectionType = .no
        passwordField.isSecureTextEntry = true
        passwordField.clearButtonMode = .always
        
        loginButton.backgroundColor = .clear
        loginButton.setTitle("", for: .normal)
        loginButton.addTarget(nil, action: #selector(didTapLogin), for: .touchUpInside)
        
        loginButtonImage.clipsToBounds = true
        loginButtonImage.layer.cornerRadius = 20.0
        loginButtonImage.image = UIImage(named: "catPaw")
        
        registerButton.setTitle("Зарегистрироваться", for: [])
        registerButton.titleLabel?.font = UIFont(name: "GillSans-SemiBold", size: 16.0)
        registerButton.tintColor = grayCatColor
        registerButton.addTarget(nil, action: #selector(didRegister), for: .touchUpInside)
    }
    
    @objc
    private func didTapLogin(){
        UIView.animate(withDuration: 0.5,
                         delay: 0.0,
                         options: .curveEaseIn,
                         animations: {
            self.loginButtonImage.transform = CGAffineTransform(rotationAngle: .pi)})
        UIView.animate(withDuration: 0.5,
                         delay: 0.5,
                         options: .curveEaseOut,
                         animations: {
            self.loginButtonImage.transform = CGAffineTransform(rotationAngle: .pi * 2.0)})
        
        guard let email = loginField.text,
              let password = passwordField.text
        else { return }
        Auth.auth().signIn(withEmail: email, password: password) {
            authResult, error in
            guard error == nil else {
                let alert = UIAlertController(title: "Ошибка", message: error!.localizedDescription, preferredStyle: .alert)
                let alertButton = UIAlertAction(title: "OK", style: .default)
                alert.addAction(alertButton)
                self.present(alert, animated: true) {
                    self.passwordField.text = ""
                }
                return
            }
            
            self.keychain.set(email, forKey: "emailLogin")
            self.keychain.set(password, forKey: "password")
            
            guard let user = authResult?.user else { return }
            if user.isEmailVerified {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                let alert = UIAlertController(title: "Ошибка", message: "Ваш аккаунт не верифицирован. Проверьте почту.", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .cancel)
                let sendButton = UIAlertAction(title: "Направить проверку снова", style: .default) {_ in
                    user.sendEmailVerification()
                }
                alert.addAction(okButton)
                alert.addAction(sendButton)
                self.present(alert, animated: true)
            }
                
        }
    }
    
    @objc
    private func didRegister() {
            performSegue(withIdentifier: "registerSegue", sender: nil)
    }
}
