//
//  ViewController.swift
//  LampAlert
//
//  Created by TJ on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lampIv: UIImageView!
    
    @IBOutlet weak var onBtn: UIButton!
    @IBOutlet weak var offBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    enum lampState{
        case OFF
        case ON
        case REMOVE
    }
    
    var currentState = lampState.OFF
    let stateImage: [lampState:String] = [lampState.OFF : "lamp_off.png" , lampState.ON : "lamp_on.png" , lampState.REMOVE : "lamp_remove.png"]
        // 굳이 이렇게 안해도 enum rawValue 활용하면 될드
    override func viewDidLoad() {
        super.viewDidLoad()
        initSet()
        // Do any additional setup after loading the view.
    }
    
    func initSet()
    {
        lampIv.image = UIImage(named: "lamp_off.png")
        currentState = lampState.OFF
    }

  
    @IBAction func touchOnBtn(_ sender: UIButton) {
        
        
        if(currentState == lampState.REMOVE)
        {
            let testAlert = UIAlertController(title: "경고", message: "램프를 먼저 장착해주세요.", preferredStyle: .alert)
            
            let actionDefault = UIAlertAction(title: "네 알겠습니다.", style: .default , handler: {ACTION in
                print("Default action called")
            })
            testAlert.addAction(actionDefault)
            present(testAlert, animated: true)
        }
        else
        {
            let testAlert = UIAlertController(title: "경고", message: "램프가 켜졌습니다.", preferredStyle: .alert)
            
            let actionDefault = UIAlertAction(title: "네 알겠습니다.", style: .default , handler: {ACTION in
                self.currentState = lampState.ON
                self.changeLamp()

            })
            testAlert.addAction(actionDefault)
            present(testAlert, animated: true)
            
        }
    }
    
    @IBAction func touchOffBtn(_ sender: UIButton) {
        
        if(currentState == lampState.REMOVE)
        {
            let testAlert = UIAlertController(title: "경고", message: "램프를 먼저 장착해주세요.", preferredStyle: .alert)
            
            let actionDefault = UIAlertAction(title: "네 알겠습니다.", style: .default , handler: {ACTION in
                print("Default action called")
            })
            testAlert.addAction(actionDefault)
            present(testAlert, animated: true)
        }
        else
        {
            let testAlert = UIAlertController(title: "경고", message: "램프가 끄시겠습니까?.", preferredStyle: .alert)
            
            let actionYes = UIAlertAction(title: "네", style: .default , handler: {ACTION in
                self.currentState = lampState.OFF
                self.changeLamp()

            })
            let actionNo = UIAlertAction(title: "아니오", style: .default , handler: {ACTION in
            })
            testAlert.addAction(actionYes)
            testAlert.addAction(actionNo)

            present(testAlert, animated: true)
            
        }
    }
    
    @IBAction func touchDeleteBtn(_ sender: UIButton) {
        
        if(currentState == lampState.REMOVE)
        {
            let testAlert = UIAlertController(title: "경고", message: "램프를 먼저 장착해주세요.", preferredStyle: .alert)
            
            let actionDefault = UIAlertAction(title: "네 알겠습니다.", style: .default , handler: {ACTION in
                print("Default action called")
                self.changeLamp()

            })
            testAlert.addAction(actionDefault)
            present(testAlert, animated: true)

        }
        else
        {
            let testAlert = UIAlertController(title: "경고", message: "램프가 켜졌습니다.", preferredStyle: .alert)
            
            let actionRemove = UIAlertAction(title: "네 제거합니다.", style: .destructive , handler: {ACTION in
                self.currentState = lampState.REMOVE
                self.changeLamp()

            })
            let actionOn = UIAlertAction(title: "아니오 켭니다", style: .default , handler: {ACTION in
                self.currentState = lampState.ON
                self.changeLamp()

            })
            let actionOff = UIAlertAction(title: "아니오 끕니다.", style: .default , handler: {ACTION in
                self.currentState = lampState.OFF
                self.changeLamp()

            })
            testAlert.addAction(actionRemove)
            testAlert.addAction(actionOn)
            testAlert.addAction(actionOff)
            present(testAlert, animated: true)
        }

        
    }
    
    func changeLamp()
    {
        var test = stateImage[currentState] ?? ""
        print(test)
	    }
}

