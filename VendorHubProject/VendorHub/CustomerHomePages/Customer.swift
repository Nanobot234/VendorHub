//
//  Customer.swift
//  VendorHub
//
//  Created by Nana Bonsu on 3/13/22.
//

import Foundation
import FirebaseAuth

class Customer {

    var name:String
    var email:String
    var Location:String
    var ErrorWithLogin:Bool
    let auth = Auth.auth()
    
    init(newName:String,email:String){
        self.name = newName
        self.email = email
        self.Location = ""
        self.ErrorWithLogin = false
    }
    
    func setCusotomerName(newName:String){
        self.name = newName
    }
    
    func setCustomerEmail(newCustomerEmail:String){
        self.email = newCustomerEmail
    }

    func signUp(email: String,password: String){
        auth.createUser(withEmail: email, password: password) {[weak self]
            result,error in guard result != nil, error == nil else {
            return}
    //returns erroer
        }
    }
    
    
    func signin(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { (result,error) in
            if error == nil {
                self.ErrorWithLogin = true
            }
            
         
        }
    }



}
