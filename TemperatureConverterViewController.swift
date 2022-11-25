//
//  TemperatureConverterViewController.swift
//  TemperatureApp
//
//  Created by TEO on 25/11/22.
//

import UIKit

class TemperatureConverterViewController: UIViewController {
    
    private struct Const{
        static let offset = 32.0
        static let conversionFactor = 1.8
    }
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var temperatureTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        convertTempertature()
        temperatureTextField.resignFirstResponder()
    }
    
    private func convertTempertature(){
        let celcius = temperatureTextField.text ?? "0"
        guard let celciusTurned = Double(celcius) else { return }
        setUpResultLabel(fahrenheit: convertCelciusToFahrenheit(celcius: celciusTurned))
    }
    
    private func convertCelciusToFahrenheit(celcius: Double) -> Double{
        return (celcius*Const.conversionFactor)+Const.offset
    }
    
    
    private func setUpResultLabel(fahrenheit: Double){
        resultLabel.text = "\(fahrenheit) ºF"
    }

    

}
