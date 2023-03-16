//
//  EditViewController.swift
//  NavigationStaticDataFlow
//
//  Created by TJ on 2022/06/11.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var switchLED: UISwitch!
    
    
    var textWayValue : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        lblWay.text = textWayValue
        tfMessage.text = Message.message
        switchLED.isOn = Message.isOnLED
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func touchCompleteBtn(_ sender: UIButton) {
        Message.message = tfMessage.text ?? ""
        Message.isOnLED = switchLED.isOn
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeLedSwitch(_ sender: UISwitch) {
    }
}
