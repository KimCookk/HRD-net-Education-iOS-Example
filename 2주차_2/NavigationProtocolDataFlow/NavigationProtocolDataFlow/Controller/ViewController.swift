//
//  ViewController.swift
//  NavigationStaticDataFlow
//
//  Created by TJ on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var imgLED: UIImageView!
    
    var isOnLED: Bool = true
    
    enum lampState : String
    {
        case ON = "lamp_on.png"
        case OFF = "lamp_off.png"
    }
    
    // 앱 실행 시 , BackGround 에서 View 되는 경우 viewDidLoad 발생 X
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgValue = lampState.ON.rawValue ?? ""
        imgLED.image = UIImage(named: imgValue)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        if(segue.identifier == "editBarButton")
        {
            editViewController.textWayValue = "Segue : use BarButton!"
        }
        else
        {
            editViewController.textWayValue = "Segue : use Button!"
            // 바로 label.text 접근하면 안되는가?
        }
        
        editViewController.textMessage = tfMessage.text ?? ""
        editViewController.isOnLED = isOnLED
        
        //Message.message = tfMessage.text ?? ""
        editViewController.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        tfMessage.text = Message.message
//        if(Message.isOnLED)
//        {
//            imgLED.image = UIImage(named: lampState.ON.rawValue ?? "" )
//
//        }
//        else
//        {
//            imgLED.image =  UIImage(named: lampState.OFF.rawValue ?? "")
//
//        }
    }
}

extension ViewController: EditDelegate
{
    func didIsOnChangeDone(_ controller: EditViewController, isOn: Bool) {
        if(isOn)
        {
            imgLED.image = UIImage(named: lampState.ON.rawValue ?? "" )
            isOnLED = true
        }
        else
        {
            imgLED.image = UIImage(named: lampState.OFF.rawValue ?? "" )
            isOnLED = false
        }
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        tfMessage.text = message
    }
}

