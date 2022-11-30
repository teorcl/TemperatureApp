//
//  LoginViewController.swift
//  TemperatureApp
//
//  Created by TEO on 25/11/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private struct Constant{
        static let expectedEmail = "hola@test.com"
        static let expectedPassword = "Password123*"
        static let successValidationMessage = "Conexion exitosa"
        static let failureValidationMessage = "Credenciales incorrectas"
        static let noMessage = String()
        static let temperatureConverter = "temperatureConverter_segue"
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        processCredential()
        passwordTextField.text?.removeAll()
    }
    
    func processCredential(){
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let credentialsAreValid = validateCredentials(email: email, password: password)
        processValidationResult(result: credentialsAreValid)
        
    }
    
    func validateCredentials(email:String, password:String) -> Bool {
        return email == Constant.expectedEmail && password == Constant.expectedPassword
    }
    
    func processValidationResult(result:Bool){
        if result {
            updateLabel(label: resultLabel, message: Constant.noMessage, hidden: true)
            excuteTransition()
        } else {
            updateLabel(label: resultLabel, message: Constant.failureValidationMessage, hidden: false)
            //showError(error: Constant.failureValidationMessage)
        }
        
    }

    private func excuteTransition(){
        performSegue(withIdentifier: Constant.temperatureConverter, sender: self)
    }
    
    /*private func showError(error: String){
        resultLabel.text = error
        resultLabel.isHidden = false
    }*/
    
    private func updateLabel(label: UILabel, message: String?, hidden: Bool){
        label.text = message
        label.isHidden = hidden
    }

}

