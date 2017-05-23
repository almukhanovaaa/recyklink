//
//  MapView.swift
//  Monster
//
//  Created by Kim Kiori on 10.04.17.
//  Copyright © 2017 Kim Kiori. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
class MapView: UIViewController {
    var ref: FIRDatabaseReference!
    var receivedloginmap = String()
    var receivedpasswordmap = String()
    var logindb = String()
    var firstnamedb = String()
    var secondnamedb = String()
    var scoredb = String()

    
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated:true);
        super.viewDidLoad()
         ref = FIRDatabase.database().reference()
        ref.child(receivedloginmap).observeSingleEvent(of: . value, with:{(snapshot) in
            let value = snapshot.value as? NSDictionary
            self.logindb = value?["Login"] as? String ?? ""
            self.firstnamedb = value?["First Name"] as? String ?? ""
            self.secondnamedb = value?["Last Name"] as? String ?? ""
            self.scoredb = value?["Score"] as? String ?? ""
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sendinfo(_ sender: Any) {
        ref.child(receivedloginmap).observeSingleEvent(of: . value, with:{(snapshot) in
            let value = snapshot.value as? NSDictionary
            self.logindb = value?["Login"] as? String ?? ""
            self.firstnamedb = value?["First Name"] as? String ?? ""
            self.secondnamedb = value?["Last Name"] as? String ?? ""
            self.scoredb = value?["Score"] as? String ?? ""
        })
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "MyProfileView")
        {
        let new: MyProfileView = segue.destination as! MyProfileView;
        new.receivedloginmp = logindb
        new.receivedfirstnamemp = firstnamedb
        new.receivedsecondnamemp = secondnamedb
        new.receivedscoremp = scoredb
        }
        if(segue.identifier == "ChoosePassView")
        {
            let new: ChoosePassView = segue.destination as! ChoosePassView;
            new.receivedlogincpv = receivedloginmap
        }
       
    }

    }





    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


