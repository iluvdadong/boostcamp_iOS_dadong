//
//  SignUpViewController.swift
//  LoginProject
//
//  Created by dadong on 2017. 7. 11..
//  Copyright © 2017년 Dadong. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Profile
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pswTextField: UITextField!
    @IBOutlet weak var pswcheckTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        
        idTextField.delegate = self
        pswTextField.delegate = self
        pswcheckTextField.delegate = self

        // Do any additional setup after loading the view.
    }

    //MARK: method
    @IBAction func selectPhoto(_ sender: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func cancelDissappear(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signupDissappear(_ sender: Any) {
        
        if let id = idTextField.text, let psw = pswTextField.text, let pswcheck = pswcheckTextField.text {
            
            if id == "" {
                print("ID를 입력하시오")
                return
            }
            
            if psw == "" || pswcheck == "" {
                print("비밀번호를 입력하시오")
                return
            }
            
            if psw == pswcheck {
                dismiss(animated: true, completion: nil)
            }
            else {
                print("비밀번호와 비밀번호 확인이 일치하지 않습니다")
                return
            }
        }
        
    
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }

    
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
            textField.resignFirstResponder()
            return true
    }

}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

extension UIView {
    
 
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
