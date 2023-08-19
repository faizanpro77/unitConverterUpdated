//
//  MenueViewController.swift
//  unitConverterUpdated
//
//  Created by MD Faizan on 02/12/22.
//

import UIKit

class MenueViewController: UIViewController {

    @IBOutlet weak var lengthButton: UIButton!
    
    
    @IBOutlet weak var volumeButton: UIButton!
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
//        check.insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
       
        
        lengthButton.layer.cornerRadius = 10
        volumeButton.layer.cornerRadius = 10
        
//        lengthButton.layer.borderColor = UIColor.lightGray.cgColor
//        lengthButton.layer.borderWidth = 1
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        <#code#>
//    }
    
    @IBAction func lenghtButtonPressed(_ sender: UIButton) {
        

        
        let Length = self.storyboard?.instantiateViewController(withIdentifier: "LengthViewController") as! LengthViewController
        
        self.navigationController?.pushViewController(Length, animated: true)
    }
    
    
    
    @IBAction func volumeButtonPressed(_ sender: UIButton) {
        
        let Volume = self.storyboard?.instantiateViewController(withIdentifier: "VolumeViewController") as! VolumeViewController
        self.navigationController?.pushViewController(Volume, animated: true)
    }
    
    
    @IBAction func tempratureButtonPressed(_ sender: UIButton) {
      let Temprature =  self.storyboard?.instantiateViewController(withIdentifier: "TempratureViewController") as! TempratureViewController
        self.navigationController?.pushViewController(Temprature, animated: true)
    }
}
















