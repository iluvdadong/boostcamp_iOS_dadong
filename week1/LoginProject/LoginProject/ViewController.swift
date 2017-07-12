//
//  ViewController.swift
//  LoginProject
//
//  Created by DaHye on 2017. 7. 2..
//  Copyright © 2017년 Dadong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        initTapGesture()
    }

    fileprivate func initTapGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
    }

    @IBAction func signinAction(_ sender: AnyObject) {
        print("touch up inside - sign in")
        print("ID : \(idTextField.text!),  PW : \(pwTextField.text!)")
        
        dismissKeyboard()
    }
    
    
    @IBAction func signupAction(_ sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        self.present(controller, animated: true, completion: nil)
    
   
    }
    

    
    
}

