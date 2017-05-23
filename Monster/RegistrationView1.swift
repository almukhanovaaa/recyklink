//
//  RegistrationView1.swift
//  Monster
//
//  Created by Kim Kiori on 01.04.17.
//  Copyright © 2017 Kim Kiori. All rights reserved.
//

import UIKit
import FirebaseDatabase
class RegistrationView1: UIViewController {
var ref: FIRDatabaseReference!
    var receivedlogin = String()
    var receivedpassword = String()
    override func viewDidLoad() {
        super.viewDidLoad()
 ref = FIRDatabase.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var repeatpassword: UITextField!
    @IBOutlet weak var firstname: UITextField!
    
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var wrongpassword: UILabel!
    @IBAction func nextregistrationbutton2(_ sender: Any) {
        if (receivedpassword != repeatpassword.text)
        {
          wrongpassword.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute:
                {
                    self.wrongpassword.isHidden = true
            })
        }
        else
        {
            ref?.child(receivedlogin).child("First Name").setValue(firstname.text!)
            ref?.child(receivedlogin).child("Last Name").setValue(lastname.text!)
            performSegue(withIdentifier: "RegistrationView2", sender: nil)

        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let new: RegistrationView2 = segue.destination as! RegistrationView2;
        new.receivedlogin2 = receivedlogin
        
            /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}
