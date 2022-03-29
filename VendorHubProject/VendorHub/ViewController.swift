//
//  ViewController.swift
//  VendorHub
//
//  Created by Nana Bonsu on 3/5/22.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    
    var ref = Database.database().reference()
    let myStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    let auth = Auth.auth()

    @IBOutlet weak var vendorName: UITextField!
    @IBOutlet weak var vendorEmail: UITextField!
    @IBOutlet weak var vendorPassword: UITextField!
   @IBOutlet weak var vendorLogInButton: UIButton!
    
    @IBOutlet weak var VendorLoginEmail: UITextField!
    
    @IBOutlet weak var VendorLoginPassword: UITextField!
    
    
    @IBOutlet weak var VendorSignUpError: UILabel!
    
    @IBOutlet weak var LoginerrorLabel: UILabel!
    
    @IBOutlet weak var nameError: UILabel!
    
    @IBOutlet weak var EmailError: UILabel!
    
    
    @IBOutlet weak var PasswordError: UILabel!
    
    var customerEmailTextVal = "";
    var customerPasswordVal = "";
    
    @IBOutlet weak var LocationPageButton: UIButton!
    
    
    var VendorModel:Customer!
    //why the exclamation mark and other things too
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    
    
    
    
    @IBAction func sendVendorInfoToFirebase(_ sender: UIButton) {
        //make a classs in swift herer, then
    
        
    
        self.ref.child("Vendors").setValue(vendorName.text!)
        self.ref.child("Vendors").child(vendorName.text!).setValue(["email":vendorEmail.text!])
      
        auth.createUser(withEmail: vendorEmail.text!, password: vendorPassword.text!) {
            (result,error) in
            if error != nil {
                self.VendorSignUpError.text = "User Already Exists With Those Credentials"
            } else {
                self.performSegue(withIdentifier: "signUp", sender: self)
            }
            
        }
        
    }
    
    @IBAction func authenticateVendor(_ sender: UIButton) {
        
        auth.signIn(withEmail: VendorLoginEmail.text!, password: VendorLoginPassword.text!) { (result,error) in
            if error != nil {
                self.LoginerrorLabel.text = "Your email or password is incorrect"
                self.LoginerrorLabel.alpha = 1
            } else{
                
                //segue to go Dimitar's storyboard
               self.performSegue(withIdentifier: "goToVendorHome", sender: self)
               
              
            }
            
         
        }
        
    }
    
    
    @IBAction func locationPageButtonPressed(_ sender: Any) {
        
    }
    
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToLocationStoryboard" {
            guard segue.destination is VendorFunctionController else {return }
        }
        
        
    
    }
    
}

