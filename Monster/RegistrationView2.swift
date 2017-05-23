//
//  RegistrationView2.swift
//  Monster
//
//  Created by Kim Kiori on 01.04.17.
//  Copyright © 2017 Kim Kiori. All rights reserved.
//

import UIKit
import FirebaseDatabase
class RegistrationView2: UIViewController {
var ref: FIRDatabaseReference!
    var receivedlogin2 = String()
    var monsterselected = Int()

    @IBOutlet weak var firstmonster: UIButton!
    @IBOutlet weak var secondmonster: UIButton!
    @IBOutlet weak var thirdmonster: UIButton!
    @IBOutlet weak var choose: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
 ref = FIRDatabase.database().reference()
        // Do any additional setup after loading the view.
    }
    @IBAction func firstmonster(_ sender: Any) {
        firstmonster.isSelected = true
        secondmonster.isSelected = false
        thirdmonster.isSelected = false
        monsterselected = 1
    }
    @IBAction func secondmonster(_ sender: Any) {
        firstmonster.isSelected = false
        secondmonster.isSelected = true
        thirdmonster.isSelected = false
        monsterselected = 2
    }
    @IBAction func thirdmonster(_ sender: Any) {
        firstmonster.isSelected = false
        secondmonster.isSelected = false
        thirdmonster.isSelected = true
        monsterselected = 3
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func finishregistration(_ sender: Any) {
        if(monsterselected != 1 && monsterselected != 2 && monsterselected != 3)
        {
            choose.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute:
                {
                    self.choose.isHidden = true
            })
            

        }
        else {
            ref?.child(receivedlogin2).child("Kinky").setValue(monsterselected)
            performSegue(withIdentifier: "MapView2", sender: nil)
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "MapView2")
        {
            let new: MapView = segue.destination as! MapView;
            new.receivedloginmap = receivedlogin2
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
