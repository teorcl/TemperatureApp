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
        static let invalidEmail: String = "Correo no válido"
    }
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var message: String = ""
    var saveRegister = [String : String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createButtonPressed() {
        validateRegistration()
    }
    
    private func setUpResultLabel(message:String){
        resultLabel.isHidden = false
        resultLabel.text = message
    }
    
    private func validateData(email: String, password: String, confirmPassword: String){
        message = getScenario(email: email, password: password, confirmPassword: confirmPassword)
        setUpResultLabel(message: message)
    }
    
    private  func validateRegistration() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let confirmPassword = confirmPasswordTextField.text ?? ""
        
        validateData(email: email, password: password, confirmPassword: confirmPassword)
        
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailReg)
        return emailTest.evaluate(with: email)
    }
    
    private func arePasswordeSame(password: String, confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
    
    private func getScenario(email: String, password: String, confirmPassword: String) -> String {
        var scenario = String()
        if email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            scenario = Const.emptyField
        }else{
            if isValidEmail(email: email) && !arePasswordeSame(password: password, confirmPassword: confirmPassword) {
                scenario = Const.ERROR_PASSWORD
            } else{
                if email == Const.existingUser && arePasswordeSame(password: password, confirmPassword: confirmPassword) {
                    scenario = Const.ERROR_USER
                }else{
                    // Credenciales correctas
                    if isValidEmail(email: email) && arePasswordeSame(password: password, confirmPassword: confirmPassword){
                        saveRegister[email] = password
                        scenario = Const.REGISTER_SUCCESSFUL
                    }else{
                        scenario = Const.invalidEmail
                    }
                    
                }
            }
        }
        return scenario
    }
    
    // Crear un grandiente como subcapa
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
