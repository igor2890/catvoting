//
//  RegisterController.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 08.12.2021.
//

import UIKit

class RegisterViewController: UIViewController, RegisterViewControllerProtocol {

    @IBOutlet weak var loginRegField: UITextField!
    @IBOutlet weak var passwordRegField: UITextField!
    @IBOutlet weak var regButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let configurator: RegisterConfiguratorProtocol = RegisterConfigurator()
    var presenter: RegisterPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        configureSubViews()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    @objc
    func hideKeyboard() {
        loginRegField.endEditing(true)
        passwordRegField.endEditing(true)
    }
    
    private func configureSubViews() {
        loginRegField.backgroundColor = orangeCatColor
        loginRegField.isOpaque = true
        loginRegField.layer.cornerRadius = 25.0
        loginRegField.clipsToBounds = true
        loginRegField.font = UIFont(name: "GillSans-SemiBold", size: 30.0)
        loginRegField.textColor = whiteCatColor
        loginRegField.textAlignment = .center
        loginRegField.textContentType = .username
        loginRegField.keyboardType = .emailAddress
        loginRegField.autocorrectionType = .no
        loginRegField.clearButtonMode = .always
        
        passwordRegField.backgroundColor = orangeCatColor
        passwordRegField.isOpaque = true
        passwordRegField.layer.cornerRadius = 25.0
        passwordRegField.clipsToBounds = true
        passwordRegField.font = UIFont(name: "GillSans-SemiBold", size: 30.0)
        passwordRegField.textColor = whiteCatColor
        passwordRegField.textAlignment = .center
        passwordRegField.textContentType = .password
        passwordRegField.autocorrectionType = .no
        passwordRegField.isSecureTextEntry = true
        passwordRegField.clearButtonMode = .always
        
        regButton.tintColor = grayCatColor
        regButton.titleLabel?.font = UIFont(name: "GillSans-SemiBold", size: 18.0)
        regButton.addTarget(nil, action: #selector(tapRegister), for: .touchUpInside)
        
        closeButton.tintColor = redCatColor
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
        presenter.closeViewTapped()
    }
    
    func setLoginFieldPlaceholder(with text: String) {
        loginRegField.placeholder = text
    }
    
    func setPasswordFieldPlaceholder(with text: String) {
        passwordRegField.placeholder = text
    }
    
    func setRegButtonTitle(with text: String) {
        regButton.setTitle(text, for: [])
    }
    
    func setCloseButtonTitle(with text: String) {
        closeButton.setTitle(text, for: [])
    }
    
    func showActivityIndicator(_ isShowing: Bool){
        isShowing ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
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

