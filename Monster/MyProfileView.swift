//
//  MyProfileView.swift
//  Monster
//
//  Created by Kim Kiori on 11.04.17.
//  Copyright © 2017 Kim Kiori. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class MyProfileView: UIViewController {
    var ref: FIRDatabaseReference!
    var receivedloginmp = String();
    var receivedfirstnamemp = String();
    var receivedsecondnamemp = String();
    var receivedscoremp = String()
    @IBOutlet weak var loginmp: UITextField!
    @IBOutlet weak var firstnamemp: UITextField!
    @IBOutlet weak var secondnamemp: UITextField!
    @IBOutlet weak var scoremp: UITextField!

    @IBOutlet weak var logintry: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        loginmp.text = receivedloginmp
        firstnamemp.text = receivedfirstnamemp
        secondnamemp.text = receivedsecondnamemp
        scoremp.text = receivedscoremp
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
    }
    




    
    

    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
