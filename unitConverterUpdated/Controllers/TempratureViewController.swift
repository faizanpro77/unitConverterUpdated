//
//  TempratureViewController.swift
//  unitConverterUpdated
//
//  Created by MD Faizan on 02/12/22.

import UIKit

class TempratureViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabelTextField: UILabel!
    @IBOutlet weak var measurePicker: UIPickerView!
    
    let lengthArray1 = ["Celsius", "Fahrenheit", "Kelvin"]
    let lenghthArray2 = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var firstPicker:String?
    var secondPicker:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.delegate = self
        measurePicker.delegate = self
        measurePicker.dataSource = self
        
        //text field properties
        inputTextField.placeholder = "Enter Value"
        
        //after open screen keyboard open automatically without clicking on textFeild
        inputTextField.becomeFirstResponder()
        
        outputLabelTextField.layer.borderWidth = 1
        outputLabelTextField.layer.borderColor = UIColor.black.cgColor
        outputLabelTextField.text = "--"
        
        firstPicker = lengthArray1[measurePicker.selectedRow(inComponent: 0)]
        secondPicker = lenghthArray2[measurePicker.selectedRow(inComponent: 0)]
        
        print("========> \(inputTextField.text!)")
    }
    
    //its called when we press any character key
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(" shouldChangeCharactersIn------ ")
        let allowedNumber = CharacterSet.decimalDigits
        let digitSet = CharacterSet(charactersIn: string)
        return allowedNumber.isSuperset(of: digitSet)
    }
    
    //its called only valid key is pressed
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("textFieldDidChangeSelection-----")
        calculateLenght(firstPicker: firstPicker!, secondPicker: secondPicker!)
    }
    
    //this function called when we pressed return or done button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextField.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return lengthArray1.count
        } else {
            return lenghthArray2.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return lengthArray1[row]
        } else {
            return lenghthArray2[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            firstPicker = lengthArray1[row]
            print("firstPicker============",firstPicker!)
        }else {
            secondPicker = lenghthArray2[row]
            print("secondPicker=======", secondPicker!)
        }
        calculateLenght(firstPicker: firstPicker!, secondPicker: secondPicker!)
    }
    
    func calculateLenght(firstPicker:String, secondPicker:String) {
        
        print("+++++++++++",inputTextField.text!)
        
        guard let text = inputTextField.text,
              !text.isEmpty else{
            return
        }
        
        //##Double why
        guard let value = Double(text) else{
            return
        }
        
        //"inch", "feet", "yard"
        print("=============>",text)
        var result:Double = 0
        
        if firstPicker == "Celsius" && secondPicker == "Celsius" {
            result = value
            outputLabelTextField.text = (" \(result) cl")
        } else if firstPicker == "Celsius" && secondPicker == "Fahrenheit" {
            result = (value * 9/5) + 32
            outputLabelTextField.text = (" \(String(format: "%.4f", result)) fh")
        } else if firstPicker == "Celsius" && secondPicker == "Kelvin" {
            result = value + 273.15
            outputLabelTextField.text = ("\(String(format: "%.4f", result)) kl")
        } else if firstPicker == "Fahrenheit" && secondPicker == "Fahrenheit" {
            result = value
            outputLabelTextField.text = (" \(String(format: "%.4f", result)) fh")
        } else if firstPicker == "Fahrenheit" && secondPicker == "Celsius" {
            result = (value - 32) * 5/9
            outputLabelTextField.text = (" \(result) ft")
            
        } else if firstPicker == "Fahrenheit" && secondPicker == "Kelvin" {
            result = (value - 32) * 5/9 + 273.15
            outputLabelTextField.text = (" \(String(format: "%.4f", result)) kl")
            
        } else if firstPicker == "Kelvin" && secondPicker == "Kelvin" {
            result = value
            outputLabelTextField.text = ("\(String(format: "%.2f", result)) kl")
        } else if firstPicker == "Kelvin" && secondPicker == "Celsius" {
            result = value  - 273.15
            outputLabelTextField.text = (" \(String(format: "%.4f", result)) cl")
            
        } else if firstPicker == "Kelvin" && secondPicker == "Fahrenheit" {
            result = (value  - 273.15) * 9/5 + 32
            outputLabelTextField.text = (" \(String(result)) fh")
        }
    }
}




