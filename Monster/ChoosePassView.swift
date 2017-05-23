//
//  ChoosePassView.swift
//  Monster
//
//  Created by Kim Kiori on 21.04.17.
//  Copyright © 2017 Kim Kiori. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ChoosePassView: UIViewController {
    var ref: FIRDatabaseReference!
 var receivedlogincpv = String()
    var choosepass = String()
    var initialscore = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        ref.child(receivedlogincpv).observeSingleEvent(of: . value, with:{(snapshot) in
            let value = snapshot.value as? NSDictionary
            self.initialscore = value?["Score"] as? String ?? ""
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ForCharity(_ sender: Any) {
        ref = FIRDatabase.database().reference()
        ref.child(receivedlogincpv).observeSingleEvent(of: . value, with:{(snapshot) in
            let value = snapshot.value as? NSDictionary
            self.initialscore = value?["Score"] as? String ?? ""
        })
    }

    @IBAction func NotForCharity(_ sender: Any) {
        ref = FIRDatabase.database().reference()
        ref.child(receivedlogincpv).observeSingleEvent(of: . value, with:{(snapshot) in
            let value = snapshot.value as? NSDictionary
            self.initialscore = value?["Score"] as? String ?? ""
        })
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if(segue.identifier=="NotForCharity")
      {
        let new: EnterCodeView = segue.destination as! EnterCodeView;
        new.receivedchoosepass="NotForCharity"
        new.recevedloginec = receivedlogincpv
        new.receivedinitialscore = initialscore
    }
        if(segue.identifier=="ForCharity")
        {
            let new: EnterCodeView = segue.destination as! EnterCodeView;
            new.receivedchoosepass="ForCharity"
            new.recevedloginec = receivedlogincpv
            new.receivedinitialscore = initialscore
        }
    }


}
