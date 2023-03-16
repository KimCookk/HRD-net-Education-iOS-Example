//
//  EditController.swift
//  ProtocolSwitchLamp
//
//  Created by TJ on 2022/06/12.
//

import UIKit

class EditController: UIViewController {

    var lampIsOn: Bool = true
    var redIsOn: Bool = true
    
    var lampState: LampState = LampState.Off
    
    @IBOutlet weak var lampIsOnSwitch: UISwitch!
    @IBOutlet weak var lampIsRedSwitch: UISwitch!
    
    var delegate: EditDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI()
    {
        switch lampState {
        case .Off:
            lampIsOnSwitch.isOn = false
            lampIsRedSwitch.isOn = false
            lampIsRedSwitch.isEnabled = false
        case .On:
            lampIsOnSwitch.isOn = true
            lampIsRedSwitch.isOn = false
        case .RED:
            lampIsOnSwitch.isOn = true
            lampIsRedSwitch.isOn = true
        }
    }
    
    @IBAction func TouchCompleteBtn(_ sender: UIButton) {
        if(delegate != nil)
        {
            delegate?.didCompleteDone(self, lampState: lampState)
            print(lampState)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func changeIsOnSwitch(_ sender: UISwitch) {
        let isOn = lampIsOnSwitch.isOn
        let isRed = lampIsRedSwitch.isOn
        if(isOn)
        {
            if(isRed)
            {
                lampState = LampState.RED
            }
            else
            {
                lampState = LampState.On
            }
            lampIsRedSwitch.isEnabled = true
        }
        else
        {
            lampState = LampState.Off
            lampIsRedSwitch.isOn = false
            lampIsRedSwitch.isEnabled = false
        }
    }
    @IBAction func changeIsRedSwitch(_ sender: UISwitch) {
        let isOn = lampIsOnSwitch.isOn
        let isRed = lampIsRedSwitch.isOn
        if(isRed)
        {
            lampState = LampState.RED
        }
        else
        {
            if(isOn)
            {
                lampState = LampState.On
            }
            else
            {
                lampState = LampState.Off
            }
        }
    }
    
}
