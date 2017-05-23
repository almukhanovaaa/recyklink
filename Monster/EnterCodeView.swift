//
//  EnterCodeView.swift
//  Monster
//
//  Created by Kim Kiori on 21.04.17.
//  Copyright © 2017 Kim Kiori. All rights reserved.
//

import UIKit
import FirebaseDatabase
class EnterCodeView: UIViewController {
    var ref: FIRDatabaseReference!
var receivedchoosepass = String()
var recevedloginec = String()
var receivedinitialscore = String()
    var addscore = Int()
    
    @IBOutlet weak var scoreadded: UILabel!
    @IBOutlet weak var wrongcode: UILabel!
    @IBOutlet weak var EnterCode: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Submit(_ sender: Any) {
        if (receivedchoosepass == "NotForCharity" && EnterCode.text == "12345")
        {
            addscore = Int(self.receivedinitialscore)! + 250
            ref?.child(recevedloginec).child("Score").setValue(String(addscore))
            scoreadded.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute:
                {
                    self.scoreadded.isHidden = true
            })
        }
        else if (receivedchoosepass == "ForCharity" && EnterCode.text == "qwerty")
        {
            addscore = Int(self.receivedinitialscore)! + 500
            ref?.child(recevedloginec).child("Score").setValue(String(addscore))
            scoreadded.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute:
                {
                    self.scoreadded.isHidden = true
            })
        }
        else
        {
            wrongcode.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute:
                {
                    self.wrongcode.isHidden = true
            })
        }
    }





}
