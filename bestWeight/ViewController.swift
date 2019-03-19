//
//  ViewController.swift
//  bestWeight
//
//  Created by Khaled Marouani on 3/18/19.
//  Copyright © 2019 Khaled Marouani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    var gender = ["Male", "Feamle"]
    
    @IBOutlet weak var PickerGender: UIPickerView!
    @IBOutlet weak var laDisplayBestWeight: UILabel!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtheight: UITextField!
    @IBOutlet weak var laSelectedGender: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        PickerGender.dataSource = self
        PickerGender.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    
    var SelectedGener = 0
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        SelectedGener = row
        return gender[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        laSelectedGender.text = gender[row]
    }
    
    @IBAction func buGetBestWeight(_ sender: Any) {
        
        // calcaute best weight
        
        let age:Int  = Int(txtAge.text!)!
        let height:Int = Int(txtheight.text!)!
        
        var BestWeight = height - 100 - (age/10) 
        
        if  SelectedGener == 0  {
            // Male
            BestWeight += 10
        } else {
            BestWeight -= 10
        }
        laDisplayBestWeight.text = "Best weight \(BestWeight)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true 
    }
}
