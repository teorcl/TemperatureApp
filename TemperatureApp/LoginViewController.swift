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
        static let temperatureConverter = "temperatureConverter_segue"
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
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
        let message : String
        if result {
            //Mensaje de exito
            message = ""
            performSegue(withIdentifier: Constant.temperatureConverter, sender: self)
        } else {
            //Mensaje de error
            message = Constant.failureValidationMessage
        }
        resultLabel.text = message
        resultLabel.isHidden = false
    }


}

