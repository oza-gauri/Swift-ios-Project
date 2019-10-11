//
//  ViewController.swift
//  Test_Assignment
//
//  Created by Aress Software Pvt Ltd on 19/09/19.
//  Copyright © 2019 Aress Software Pvt Ltd. All rights reserved.
//

import UIKit
//Protocol
protocol DataPass {
    func data(object: [String: String])
}
class ViewController: UIViewController, UITabBarControllerDelegate, UITextFieldDelegate {
    var user = [User]()
     var delegate : DataPass!
    //MARK:- Variables Declaration
    @IBOutlet weak var btnRemember: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtLoginPwd: UITextField!
    @IBOutlet weak var txtLoginUser: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtLoginUser.delegate = self
        txtLoginPwd.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        user = CoreDataManager.shareInstance.getUserData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    //Remember me option
    @IBAction func onClickRemember(_ sender: Any) {
        if(txtLoginUser.text == ""){
            loadDefaults()
            print("Load")
        }
        else {
            txtLoginUser.text = ""
            txtLoginPwd.text = ""
            print("Don't load")
        }
        
    }
    //To store the username and password using user defaults
    func loadDefaults() {
        let defaults = UserDefaults.standard
        txtLoginUser.text = defaults.object(forKey: "firstName") as? String
        txtLoginPwd.text = defaults.object(forKey: "lastName") as? String
    }
    //Register segue
    @IBAction func onClickRegister(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueToRegister", sender: nil)
    }
    //To login
    @IBAction func onClickLogin(_ sender: UIButton) {
        //Validations
        if (txtLoginUser.text?.isEmpty)! == true
        {
            let usernamealert = UIAlertController(title: "Warning", message: "Please enter username", preferredStyle: UIAlertController.Style.alert)
            usernamealert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(usernamealert, animated: true, completion: nil)
            txtLoginUser.becomeFirstResponder()
        }
        if (txtLoginPwd.text?.isEmpty)! == true {
            let passwordalert = UIAlertController(title: "Warning", message: "Please enter password", preferredStyle: UIAlertController.Style.alert)
            passwordalert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(passwordalert, animated: true, completion: nil)
            txtLoginPwd.becomeFirstResponder()
        }
        checkCredentials()
        let defaults = UserDefaults.standard
        defaults.set(txtLoginUser.text, forKey: "firstName")
        defaults.set(txtLoginPwd.text, forKey: "lastName")
        defaults.synchronize()
        print("Username: \(txtLoginUser.text ?? ""), Password: \(txtLoginPwd.text ?? "")")
    }
    func checkCredentials() {
        var username = ""
        var passString = ""
        var checkRecord = false
        for item in user
        {
            username = item.value(forKeyPath: "username") as! String
            passString = item.value(forKeyPath: "password") as! String
            if username == txtLoginUser.text && txtLoginPwd.text == passString
            {
                checkRecord = true;
            }
        }
        if checkRecord == true
        {
            //succesful authenticate
            print("succesful login")
            self.performSegue(withIdentifier: "segueToMainTab", sender: nil)
            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                _ = segue.destination as! MainTab
            }
            
        }
        else
        {
            //show the error message
            print("error")
            let badcredentials = UIAlertController(title: "Warning", message: "Wrong Credentials", preferredStyle: UIAlertController.Style.alert)
            badcredentials.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(badcredentials, animated: true, completion: nil)
            
        }
    }
    
}

