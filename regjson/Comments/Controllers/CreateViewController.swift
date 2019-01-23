//
//  ViewController.swift
//  regjson
//
//  Created by Rinat Luhmanov on 22/01/2019.
//  Copyright © 2019 Rinat Luhmanov. All rights reserved.
//

import UIKit
import Firebase

class CreateViewController: UIViewController {
    
  
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repasswordField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    
    

    @IBAction func createButton(_ sender: Any) {
        if passwordField.text != repasswordField.text {
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!){ (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "createSegue", sender: self)
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
        
        /*guard let email = emailField.text, let password = passwordField.text, email != "", password != "" else {
            return
    }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (user, error) in
            if error == nil {
                if user != nil {
                    self?.performSegue(withIdentifier: "createSegie", sender: nil)
                }
            }
        }*/    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
