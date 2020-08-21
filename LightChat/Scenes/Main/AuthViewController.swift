//
//  AuthViewController.swift
//  Application
//
//  Created by Nikita Egoshin on 11.08.2020.
//  Copyright © 2020 Omega-R. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController, MainView, UITextFieldDelegate {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

	var presenter: AuthPresenter!
    
    var username: String { usernameField.text ?? "" }
    var password: String { passwordField.text ?? "" }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    // MARK: - Setup
    
    private func prepareUI() {
        // Customize UI structure appearance
    }
    
    // MARK: - Update
    
    func clearUsernameField() {
        usernameField.text = nil
    }
    
    func clearPasswordField() {
        passwordField.text = nil
    }

    // MARK: - Actions
    
    @IBAction func onRootViewTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func onLoginButtonTouch(_ sender: UIButton) {
        presenter.authTriggered()
    }
    
    // MARK: - Alert
    
    func showError(_ error: Error) {
        let vc = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        vc.addAction(okAction)
        
        present(vc, animated: true, completion: nil)
    }
    
    func showGreetings(withUsername username: String) {
        let vc = UIAlertController(title: "Congrats", message: "Welcome, \(username)!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Let's start", style: .cancel, handler: nil)
        
        vc.addAction(okAction)
        
        present(vc, animated: true, completion: nil)
    }

    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameField:
            passwordField.becomeFirstResponder()
            return false
        case passwordField:
            presenter.authTriggered()
        default:
            break
        }
        
        textField.resignFirstResponder()
        
        return true
    }

}
