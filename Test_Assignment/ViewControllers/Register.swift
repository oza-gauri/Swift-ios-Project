//
//  Register.swift
//  Test_Assignment
//
//  Created by Aress Software Pvt Ltd on 19/09/19.
//  Copyright © 2019 Aress Software Pvt Ltd. All rights reserved.
//

import UIKit


class Register: UIViewController, DataPass, UITextFieldDelegate {
   //MARK:- Variables Declaration
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
   @IBOutlet weak var btnSubmit: UIButton!
   //Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFirstName.delegate = self
        txtLastName.delegate = self
        txtUserName.delegate = self
        txtEmail.delegate = self
        txtPassword.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    @IBAction func onClickSubmit(_ sender: UIButton) {
        let dict = ["firstname": txtFirstName.text, "lastname": txtLastName.text, "username": txtUserName.text, "email": txtEmail.text, "password": txtPassword.text]
        CoreDataManager.shareInstance.save(object: dict as!  [String : String])
        print("succesful login")
        let check : Bool = checkForErrors()
        if check == true{
            print("error")
        }
        else{
            print("no error")

            self.performSegue(withIdentifier: "segueForUserLogin", sender: nil)
            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                _ = segue.destination as! MainTab
            }
        }
        
    }
 //Delegate method
    func data(object: [String : String]) {
        txtFirstName.text = object["firstname"]
        txtLastName.text = object["lastname"]
        txtUserName.text = object["username"]
        txtEmail.text = object["email"]
        txtPassword.text = object["password"]
    }
  //Validations
    func checkForErrors() -> Bool
    {
        var errors = false
        let title = "Error"
        var message = ""
        let txtfirstname = txtFirstName.text
        let txtlastname = txtLastName.text
        let txtemail = txtEmail.text
        let txtUsername = txtUserName.text
        let txtpassword = txtPassword.text
        //FIRST NAME
        if txtfirstname!.isEmpty {
            errors = true
            message += "Please enter first name"
            alertWithTitle(title:title, message: message, ViewController: self,toFocus:self.txtFirstName)
            self.txtFirstName.becomeFirstResponder()
        }
        else if !isFirst_NameValid(test: txtfirstname!)
        {
            errors = true
            message += "Invalid first name"
            alertWithTitle(title:title, message: message, ViewController: self, toFocus:self.txtFirstName)
            
        }
            //LAST NAME
        else if txtlastname!.isEmpty
        {
            errors = true
            message += "Please enter last name"
            alertWithTitle(title:title,message: message, ViewController: self,toFocus:self.txtLastName)
            self.txtLastName.becomeFirstResponder()
        }
            
        else if !isFirst_NameValid(test: txtlastname!)
        {
            errors = true
            message += "Invalid Last name"
            alertWithTitle(title:title, message: message, ViewController: self, toFocus:self.txtLastName)
        }
            //USER NAME
        else if txtUsername!.isEmpty
        {
            errors = true
            message += "Please enter user name"
            alertWithTitle(title:title,message: message, ViewController: self,toFocus:self.txtUserName)
            self.txtUserName.becomeFirstResponder()
        }
        else if !isUserName_Valid(test: txtUsername!)
        {
            errors = true
            message += "Invalid Username e.g. Abc123"
            alertWithTitle(title:title, message: message, ViewController: self, toFocus:self.txtUserName)
        }
            
            //EMAIL
        else if txtemail!.isEmpty
        {
            errors = true
            message += "Please enter email id"
            alertWithTitle(title:title,message: message, ViewController: self,toFocus:self.txtEmail)
            self.txtEmail.becomeFirstResponder()
        }
        else if !isEmail_Valid(test: txtemail!)
        {
            errors = true
            message += "Invalid Email Address \n e.g. abc@xyz.com"
            alertWithTitle(title:title, message: message, ViewController: self, toFocus:self.txtEmail)
            
        }
            //PASSWORD
        else if txtpassword!.isEmpty
        {
            errors = true
            message += "Please enter Password"
            alertWithTitle(title:title,message: message, ViewController: self,toFocus:self.txtPassword)
            self.txtPassword.becomeFirstResponder()
        }
        else if !isPassword_Valid(test: txtpassword!)
        {
            errors = true
            message += "Invalid Password e.g. Ab@112 (Minimum 8 characters)"
            alertWithTitle(title:title, message: message, ViewController: self, toFocus:self.txtPassword)
        }
        
        return errors
        
    }
    
    //ALERT FUNCTION
    func alertWithTitle(title: String!, message: String, ViewController: UIViewController,toFocus:UITextField) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        toFocus.becomeFirstResponder()
        alert.addAction(action)
        ViewController.present(alert, animated: true, completion: nil)
    }
    
    //VALIDATION FUNCTION
    func isFirst_NameValid (test:String) ->Bool{
        guard test.count >= 5, test.count < 18 else { return false }
        let predicateTest = NSPredicate(format: "SELF MATCHES %@", "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$")
        return predicateTest.evaluate(with: test)
    }
    
    func isEmail_Valid(test:String) -> Bool {
        let emailRegEx = "[A-Za-z0-9._%=-]+@[A-za-z0-9._]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: test)
    }
    
    func isUserName_Valid(test:String) -> Bool{
        let UserNameRegEx = "[a-zA-Z0-9]{5,12}"
        let UserNameTest = NSPredicate(format: "SELF MATCHES %@",UserNameRegEx)
        return UserNameTest.evaluate(with:test)
        
    }
    
    func isPassword_Valid(test:String) -> Bool{
        let PasswordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        let PasswordTest = NSPredicate(format: "SELF MATCHES %@",PasswordRegEx)
        return PasswordTest.evaluate(with:test)
    }
    
}
