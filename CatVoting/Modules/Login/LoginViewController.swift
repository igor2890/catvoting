//
//  LoginController.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 05.12.2021.
//

import UIKit

class LoginController: UIViewController, LoginViewControllerProtocol {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButtonImage: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    let configurator: LoginConfiguratorProtocol = LoginConfigurator()
    var presenter: LoginPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        configureSubViews()
        let recognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(hideKeyboard))
        recognizer.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(recognizer)
    }
    
    //MARK: LoginViewControllerProtocol
    
    func showOKAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertButton)
        present(alert, animated: true)
    }
    
    func animateLoginButton(){
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
    }
    
    func setMainLabelTitle(with text: String) {
        mainLabel.text = text
    }
    
    func setLoginFieldPlaceholder(with text: String) {
        loginField.placeholder = text
    }
    
    func setLoginFieldTitle(with text: String) {
        loginField.text = text
    }
    
    func setPasswordFieldPlaceholder(with text: String) {
        passwordField.placeholder = text
    }
    
    func setRegisterButtonTitle(with text: String) {
        registerButton.setTitle(text, for: [])
    }
    
    
    //MARK: Keyboard
    
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
        
        mainLabel.font = UIFont(name: "GillSans-SemiBold", size: 27.0)
        mainLabel.textColor = grayCatColor
        
        loginField.backgroundColor = orangeCatColor
        loginField.isOpaque = true
        loginField.layer.cornerRadius = 25.0
        loginField.clipsToBounds = true
        loginField.font = UIFont(name: "GillSans-SemiBold", size: 30.0)
        loginField.textColor = whiteCatColor
        loginField.textAlignment = .center
        loginField.textContentType = .username
        loginField.keyboardType = .emailAddress
        loginField.autocorrectionType = .no
        loginField.clearButtonMode = .always
        
        passwordField.backgroundColor = orangeCatColor
        passwordField.isOpaque = true
        passwordField.layer.cornerRadius = 25.0
        passwordField.clipsToBounds = true
        passwordField.font = UIFont(name: "GillSans-SemiBold", size: 30.0)
        passwordField.textColor = whiteCatColor
        passwordField.textAlignment = .center
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
        
        registerButton.titleLabel?.font = UIFont(name: "GillSans-SemiBold", size: 16.0)
        registerButton.tintColor = grayCatColor
        registerButton.addTarget(nil, action: #selector(didRegister), for: .touchUpInside)
    }
    
    
    @objc
    private func didTapLogin(){
        guard let email = loginField.text,
              let password = passwordField.text
        else { return }
        presenter.loginTapped(email: email, password: password)
    }
    
    @objc
    private func didRegister() {
        presenter.registerTapped()
    }
}
