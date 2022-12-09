//
//  LengthViewController.swift
//  unitConverterUpdated
//
//  Created by MD Faizan on 02/12/22.
//

import UIKit

class LengthViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let lengthArray1 = ["inch", "feet", "yard"]
    let lenghthArray2 = ["inch", "feet", "yard"]
    
    
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabelTextField: UILabel!
    @IBOutlet weak var measurePicker: UIPickerView!
    
    var firstPicker:String?
    var secondPicker:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.delegate = self
        measurePicker.delegate = self
        measurePicker.dataSource = self
        
        //text field properties
        inputTextField.placeholder = "good boy"
        
        //        inputTextField.returnKeyType = .done
        //        inputTextField.autocapitalizationType = .words
        //        inputTextField.autocorrectionType = .no
        //
        //after open screen keyboard open automatically without clicking on textFeild
        inputTextField.becomeFirstResponder()
        
        outputLabelTextField.layer.borderWidth = 1
        outputLabelTextField.layer.borderColor = UIColor.lightGray.cgColor
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
        
        //##doubt it going insid if with empty text
        //        if let check = textField.text {
        //        print("lllllll-=============\(check)")
        //        }
        
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
        
        print("+++++++++++",inputTextField.text)
        
        //why
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
        
        if firstPicker == "inch" && secondPicker == "inch" {
            result = value
            outputLabelTextField.text = (" \(result) in")
        } else if firstPicker == "inch" && secondPicker == "feet" {
            result = value * 12
            outputLabelTextField.text = (" \(String(format: "%.4f", result)) ft")
        } else if firstPicker == "inch" && secondPicker == "yard" {
            result = value / 36
            outputLabelTextField.text = (" \(String(format: "%.4f", result)) yd")
        } else if firstPicker == "feet" && secondPicker == "inch" {
            result = value * 12
            outputLabelTextField.text = (" \(String(format: "%.4f", result)) in")
        } else if firstPicker == "feet" && secondPicker == "feet" {
            result = value
            outputLabelTextField.text = (" \(result) ft")
            
        } else if firstPicker == "feet" && secondPicker == "yard" {
            result = value / 3.0
            outputLabelTextField.text = (" \(String(format: "%.4f", result)) yd")
            
        } else if firstPicker == "yard" && secondPicker == "inch" {
            result = value * 36
            outputLabelTextField.text = ("\(String(format: "%.2f", result)) in")
        } else if firstPicker == "yard" && secondPicker == "feet" {
            result = value * 3
            outputLabelTextField.text = (" \(String(format: "%.4f", result)) ft")
            
        } else if firstPicker == "yard" && secondPicker == "yard" {
            result = value
            outputLabelTextField.text = (" \(String(result)) yd")
        }
        
        
        
    }
    
    //==========================================================================================================
    //==========================================================================================================
    //## all learning is here
    
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //        let check = inputTextField.text
    // after type any charater we can get it and add it
    //        print("\(check!)========> \(check! + string)=====\(string)")
    //        return true
    //
    //    }
    
    //    @IBAction func checkInputText(_ sender: UIButton) {
    //
    //                let check = inputTextField.text
    //                print("========> \(check!)")
    //
    //        inputTextField.resignFirstResponder()
    //
    //    }
    
    
    //==========================================================================================================
    //==========================================================================================================
    
    
    
}
