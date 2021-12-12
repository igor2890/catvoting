//
//  FeedbackFormVC.swift
//  CatVoting
//
//  Created by Игорь Андрианов on 24.09.2021.
//

import UIKit

class FeedbackFormVC: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var messageTextView: UITextView!
    private var tapHideKeyboard: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        nameTextField.tag = 0
        emailTextField.delegate = self
        emailTextField.tag = 1
        messageTextView.delegate = self
        messageTextView.tag = 2
        tapHideKeyboard = UITapGestureRecognizer(
            target: self,
            action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapHideKeyboard!)
    }
    
    @objc
    private func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        var errorMessage = ""
        if nameTextField.text == "" {
            errorMessage += "Имя не заполнено\n"
        }
        if emailTextField.text == "" {
            errorMessage += "Email не заполнен\n"
        } else if !isValidEmail(emailTextField.text ?? "") {
            errorMessage += "Email некорректен\n"
        }
        if messageTextView.text == "" {
            errorMessage += "Сообщения нет\n"
        }
        
        if errorMessage != "" {
            let alert = UIAlertController(
                title: nil,
                message: errorMessage,
                preferredStyle: .alert)
            let action = UIAlertAction(
                title: "Повторить",
                style: .cancel,
                handler: nil)
            alert.addAction(action)
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(
                title: nil,
                message: "Спасибо за обращение!",
                preferredStyle: .alert)
            let action = UIAlertAction(
                title: "Ок",
                style: .cancel,
                handler: {_ in self.performSegue(withIdentifier: "unwindToMainAfterFeedback", sender: nil)})
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
