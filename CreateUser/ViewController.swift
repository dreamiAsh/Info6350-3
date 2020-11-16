//
//  ViewController.swift
//  CreateUser
//
//  Created by Leng on 11/14/20.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginAction(_ sender: Any) {
        
        let email = txtEmail.text
        let password = txtPassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid email"
            return
        }
        
        SwiftSpinner.show("Logging in...")
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            SwiftSpinner.hide()
            guard let strongSelf = self else { return }
            
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
            
            self?.txtPassword.text = ""
            
            self.performSegue(withIdentifier: "loginSeque", sender: strongSelf)
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
        }
        
    }
    
    @IBAction func signupAction(_ sender: Any) {
        let email = txtEmail.text
        let password = txtPassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid email"
            return
        }
        
        SwiftSpinner.show("Sign up...")
        Auth.auth().createUser(withEmail: email, password: password) {  [weak self] authResult, error in
            SwiftSpinner.hide()
            guard let strongSelf = self else { return }
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
            
            self?.txtPassword.text = ""
            
            self.performSegue(withIdentifier: "signupSeque", sender: strongSelf)
        }
    }
    
    @IBAction func forgotAction(_ sender: Any) {
        let email = txtEmail.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
            return
        }
        
        SwiftSpinner.show("Forgot password...")
        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] authResult, error in
            SwiftSpinner.hide()
            guard let strongSelf = self else { return }
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
            
            self.performSegue(withIdentifier: "forgotPasswordSeque", sender: strongSelf)
        }
    }
    
}








