//
//  ViewController.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/1/23.
//

import UIKit

class ViewController : UIViewController{
    var textField: UITextField = {
            let txt =  UITextField(frame: CGRect(x:0 , y:0, width:200, height: 60))
            txt.textColor = .black
            txt.placeholder = "Select Date"
            txt.textAlignment = .left
            txt.translatesAutoresizingMaskIntoConstraints = false
          
            //txt.datePicker(target: self,doneAction: #selector(doneAction),cancelAction: #selector(cancelAction),datePickerMode: .date)
           
            return txt
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.center = self.view.center
        view.addSubview(self.textField)
        self.textField.text = "test"
    }
    
}
