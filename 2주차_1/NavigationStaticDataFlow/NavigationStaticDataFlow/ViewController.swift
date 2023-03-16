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
        
        Message.message = tfMessage.text ?? ""
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tfMessage.text = Message.message
        if(Message.isOnLED)
        {
            imgLED.image = UIImage(named: lampState.ON.rawValue ?? "" )

        }
        else
        {
            imgLED.image =  UIImage(named: lampState.OFF.rawValue ?? "")

        }
        
    }
    
    


}

