//
//  ViewController.swift
//  Singleton
//
//  Created by R Shantha Kumar on 11/20/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    
     var nameLbl: UILabel!
    
     var mobileNumberLbl: UILabel!
    
    
    
  var gap = 30
    
    
    var allContacts = [[String]]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        // observed the data
       
        NotificationCenter.default.addObserver(self, selector: #selector(data(notify:)), name: NSNotification.Name("data"), object: nil)
        
    }
    
    
                  // button for instantiate to ssecond view
    
    
    
    @IBAction func submitAction(_ sender: UIButton)
    {
        
        let target = storyboard?.instantiateViewController(withIdentifier: "second") as! secondViewController
        
        
        
        
        present(target, animated: true)
        
        
    }
    
    
    
    
    
    //event handler
    
    @objc func data(notify:Notification)
    {
        
    
        let value = [notify.userInfo!["Name"] as! String, notify.userInfo!["MobileNumber"] as! String]
        
        allContacts.append(value)
        
        var ypos = 160
        
       
        var number = 1
        for x in allContacts
        {
            nameLbl = UILabel()
            nameLbl.frame = CGRect(x: 30, y: ypos, width: 150, height: 30)
            nameLbl.backgroundColor = UIColor.white
            nameLbl.text = "\(number).  \(x[0])"
            view.addSubview(nameLbl)
            
            
            
            mobileNumberLbl = UILabel()
            mobileNumberLbl.frame = CGRect(x: 230, y: ypos, width: 150, height: 30)
            mobileNumberLbl.backgroundColor = UIColor.white
            mobileNumberLbl.text = x[1]
            view.addSubview(mobileNumberLbl)
            
            
          
            
            ypos += 50
            number += 1
        }
        
        
        
        
        
        
        
        
        
        
       
        
        
//        secondName.text = notify.userInfo!["secondName"] as! String
//        age.text = notify.userInfo!["age"] as! String
//        country.text = notify.userInfo!["country"] as! String
//
        
        
        
    }
    
    


}

