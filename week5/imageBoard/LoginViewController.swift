//
//  LoginViewController.swift
//  imageBoard
//
//  Created by dadong on 2017. 8. 1..
//  Copyright © 2017년 dadong. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var signupBtn: UIButton!
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    @IBAction func loginAction(_ sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ListTableViewController")
        self.present(controller, animated: true, completion: nil)
        
    }

}
