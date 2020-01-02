//
//  secondViewController.swift
//  Singleton
//
//  Created by R Shantha Kumar on 11/20/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit

class secondViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {

    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
   
    let pickerView = UIPickerView()
    
    var msg:String?
    
    let countries = ["japan","india","germany","england","america","france","russia","china"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextField.text = countries[row]
        
        //countryPickerView.isHidden = true
  
        
    }
    
   
    
    
    
    //alert
    
    
   
    
    
    
    
    
    
    
    
    func toast(){
        
        
        let controller = UIAlertController(title: "WARING", message: "\(msg!)", preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (cancelAlert) in
            
        }
            
      controller.addAction(action)
        
      
        present(controller, animated: true, completion: nil)
        
        
    }
    

    
    @IBAction func backAcrion(_ sender: UIButton) {
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
    

   func  textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
    
    
    if(textField == name){
        
        return true
        
    }
    if(textField == mobileNumber){
        
        if(name.text!.count > 1){
            
            return true
        }else
        
        {
            
            msg = "identity name is compulsary"
            toast()
            return false
            
            
        }
        
        
    }
    
    return true
    }
    
    
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        if(textField == name){
            
            let allowCharacters = CharacterSet(charactersIn: "qwertyuiopasdfghjklzxcvbnmQWERTYYUIOPASDFGHJKLZXCVBNM ")
            
            if(string.rangeOfCharacter(from:allowCharacters) != nil || string == ""){
                
                return true
            
            }else{
                
                msg = "invalid keywords"
                toast()
                return false
                
                
            }
            
            
            
        }
        if(textField == mobileNumber){
            
            let allowCharacters = CharacterSet(charactersIn: "1234567890 ")
            
            if(string.rangeOfCharacter(from:allowCharacters) != nil || string == ""){
                
                return true
                
            }else{
                
                msg = "invalid keywords"
                toast()
                
            }
            
            
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        return true
        
    }
    var returnVal:Bool = false
    
    
    
    
    
    
    
    
    
   

        
        
        
    
  
    
    
    func isValidMobileNumer(mobileNumberStr:String) -> Bool {
        let emailRegEx = "^[6-9][0-9]{9}$"
        
        let numberPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return numberPred.evaluate(with: mobileNumberStr)
    }
    
    
    
    
    
    
    //submit action
    var bool:Bool = false
   
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if(textField == mobileNumber){
            
            bool = isValidMobileNumer(mobileNumberStr: textField.text!)
            
            
        }
            
//        else
//        {
//            
//            msg = "invalid mobile Number"
//            toast()
//            
//            
//        }
    }
    
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
//
//        if(textField == mobileNumber){
//
//            bool = isValidMobileNumer(mobileNumberStr: textField.text!)
//
//
//        }
//
//        else
//        {
//
//            msg = "invalid mobile Number"
//            toast()
//            return false
//
//        }
//
//        return true
//    }
    
    //sendi9ng data to firssst view usisng post(notification center method)
    
    
    @IBAction func submitAction(_ sender: UIButton)
    {
       
        if(name.text!.count > 1 && isValidMobileNumer(mobileNumberStr: mobileNumber.text!) == true){
            
        
        
        
        
        
        
        let dictonaryData = ["Name":name.text!,"MobileNumber":mobileNumber.text!]
        
        NotificationCenter.default.post(name: NSNotification.Name("data"), object: self, userInfo: dictonaryData)
        
        dismiss(animated: true)
        
        }
        else{
            msg = "please fill properly, and submit"
            toast()
            
        }
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        

        name.delegate = self
        mobileNumber.delegate = self
        countryTextField.delegate = self
        mobileNumber.keyboardType = .numberPad
        pickerView.delegate = self
        pickerView.dataSource = self
        
   countryTextField.inputView = pickerView

        
    }
    

  

}
