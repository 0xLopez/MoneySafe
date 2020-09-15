//
//  LoginViewController.swift
//  MoneyChallenge
//
//  Created by Juan López Bosch on 14/09/2020.
//  Copyright © 2020 Juan López. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    struct Constants {
        static let enabledAlpha: CGFloat = 1
        static let disabledAlpha: CGFloat = 0.5
    }
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Actions
    @IBAction func loginButtonPressed() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        login()
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    // MARK: - UI
    private func setupUI() {
        loginButton.roundCorners()
        setLoginButton(enabled: false)
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setLoginButton(enabled: Bool) {
        loginButton.isEnabled = enabled
        let textAlpha: CGFloat = enabled ? Constants.enabledAlpha : Constants.disabledAlpha
        loginButton.setTitleColor(UIColor.tertiary.withAlphaComponent(textAlpha), for: .normal)
    }
    
    // MARK: - Network
    private func login() {
        Loader.showActivityIndicator()
        let credentials = UserCredentials(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        Authenticator.shared.login(userCredentials: credentials, completion: handleLoginResult)
    }
    
    private func handleLoginResult(_ result: Result<Bool, APIError>) {
        Loader.hideActivityIndicator()
        switch result {
        case .failure(let error):
            Utils.showAlert(for: error, in: self)
        case .success:
            Utils.loadRootScreen(.products)
        }
    }
}

// MARK: - Text Field Delegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            textField.resignFirstResponder()
            if loginButton.isEnabled {
                login()
            }
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case emailTextField:
            if passwordTextField.text?.isEmpty ?? true {
                setLoginButton(enabled: false)
                return true
            }
        case passwordTextField:
            if emailTextField.text?.isEmpty ?? true {
                setLoginButton(enabled: false)
                return true
            }
        default:
            break
        }
        guard let currentFieldText = textField.text else {
            setLoginButton(enabled: !string.isEmpty)
            return true
        }
        setLoginButton(enabled: !(currentFieldText.count == 1 && string.isEmpty))
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        setLoginButton(enabled: false)
        return true
    }
}
