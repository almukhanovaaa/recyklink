//
//  ViewController.swift
//  Monster
//
//  Created by Kim Kiori on 31.03.17.
//  Copyright © 2017 Kim Kiori. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth


class ViewController: UIViewController {
    var ref: FIRDatabaseReference!
    var loginfromdb = String();
    var passwordfromdb = String();
    var identifier = String()
    @IBOutlet weak var loginbutton: UIButton!
    @IBOutlet weak var wrongsignin: UILabel!
    @IBOutlet weak var nextregistrationbutton: UIButton!
    
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var enterlogin: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        ref = FIRDatabase.database().reference()
        wrongsignin.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginregister(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0)
        {
            login.placeholder = "Login"
            password.placeholder = "Password"
            loginbutton.isHidden = false
            nextregistrationbutton.isHidden  = true
            
        }
            
        else if (sender.selectedSegmentIndex == 1)
        {
            login.text = ""
            password.text=""
            login.placeholder = "Create a login"
            password.placeholder = "Create a password"
            loginbutton.isHidden = true
            nextregistrationbutton.isHidden  = false
            wrongsignin.isHidden = true
        }
    }
    @IBAction func Loginbutton(_ sender: Any) {
        ref.child(login.text!).observeSingleEvent(of: . value, with:{(snapshot) in
            let value = snapshot.value as? NSDictionary
            self.loginfromdb = value?["Login"] as? String ?? ""
            self.passwordfromdb = value?["Password"] as? String ?? ""
    })
        
        if (login.text != loginfromdb || password.text != passwordfromdb)
        {
            wrongsignin.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: 
                {
                    self.wrongsignin.isHidden = true
            })
            
        }
        else
        {
            performSegue(withIdentifier: "MapView", sender: nil)
        }
        
    }



    
    @IBAction func nextregistartionbutton(_ sender: Any) {
        if(login.text != "" && password.text != "")
        {
        ref?.child(login.text!).child("Login").setValue(login.text!)
        ref?.child(login.text!).child("Password").setValue(password.text!)
        ref?.child(login.text!).child("Score").setValue("0")
        performSegue(withIdentifier: "RegistrationView1", sender: nil)
        }
        else {
            enterlogin.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute:
                {
                    self.enterlogin.isHidden = true
            })
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier  == "MapView"){
        let new: MapView = segue.destination as! MapView;
        new.receivedloginmap = login.text!
        new.receivedpasswordmap = password.text!
        }
        
       if (segue.identifier  == "RegistrationView1"){
            let new: RegistrationView1 = segue.destination as! RegistrationView1;
            new.receivedlogin = login.text!
            new.receivedpassword = password.text!
        }

    }
}
