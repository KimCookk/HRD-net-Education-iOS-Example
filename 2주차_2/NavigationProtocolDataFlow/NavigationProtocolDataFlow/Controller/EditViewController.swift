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
    var textMessage : String = ""
    var isOnLED: Bool = false;
    
    var delegate: EditDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        lblWay.text = textWayValue
        tfMessage.text = textMessage
        switchLED.isOn = isOnLED
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
//        Message.message = tfMessage.text ?? ""
//        Message.isOnLED = switchLED.isOn
      
        
        navigationController?.popViewController(animated: true)
    }
    @IBAction func changeTfMessage(_ sender: UITextField) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: tfMessage.text ?? "")
        }
    }
    @IBAction func changeLedSwitch(_ sender: UISwitch) {
        if delegate != nil {
            delegate?.didIsOnChangeDone(self, isOn: switchLED.isOn)
        }
        
    }
}
