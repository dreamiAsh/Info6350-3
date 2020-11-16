//
//  DashboardViewController.swift
//  CreateUser
//
//  Created by Leng on 11/15/20.
//

import UIKit
import Firebase

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutAction(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popViewController(animated: true)
        }
        catch let signOutError as NSError{
            print("Error signing out: %@", signOutError)
        }
    }
    
}
