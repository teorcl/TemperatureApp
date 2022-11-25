//
//  RegisterViewController.swift
//  TemperatureApp
//
//  Created by TEO on 25/11/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private struct Const{
        static let existingUser: String = "test@test.com"
        static let emptyField: String = "Uno o mas campos se encuentra vacío"
        static let ERROR_PASSWORD: String = "Las contraseñas no coinciden"
        static let ERROR_USER: String = "El usuario ya existe"
        static let REGISTER_SUCCESSFUL: String = "Registro exitoso"
    }
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var message: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setUpView()
    }
    
    @IBAction func createButtonPressed() {
        validateRegistration()
    }
    
    private func setUpResultLabel(message:String){
        resultLabel.isHidden = false
        resultLabel.text = message
    }
    
    private func validateData(email: String, password: String, confirmPassword: String){
        if email == "" || password == "" || confirmPassword == "" {
            message = Const.emptyField
        }else{
            if email != "" && (password != confirmPassword) {
                message = Const.ERROR_PASSWORD
            } else{
                if email == Const.existingUser && (password == confirmPassword) {
                    message = Const.ERROR_USER
                }else{ // Credenciales correctas
                    message = Const.REGISTER_SUCCESSFUL
                }
            }
        }
        setUpResultLabel(message: message)
    }
    
    private  func validateRegistration() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let confirmPassword = confirmPasswordTextField.text ?? ""
        
        validateData(email: email, password: password, confirmPassword: confirmPassword)
        
    }
    
    private func setUpView(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemGray.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.addSublayer(gradientLayer)
    }

}
