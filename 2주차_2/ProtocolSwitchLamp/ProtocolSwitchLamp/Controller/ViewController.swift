//
//  ViewController.swift
//  ProtocolSwitchLamp
//
//  Created by TJ on 2022/06/12.
//

import UIKit

class ViewController: UIViewController {


    
    var lampState: LampState = LampState.Off
    @IBOutlet weak var lampIv: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let destSegue = segue.destination.navigationController
        if(segue.identifier == "lampSelectBarButton")
        {
            let destController = segue.destination as! EditController
            
            destController.lampState = lampState
            destController.delegate = self
        }
        
    }
    
    func initUI()
    {
        lampIv.image = UIImage(named: lampState.rawValue)
    }

}

extension ViewController: EditDelegate
{
    func didCompleteDone(_ controller: EditController, lampState: LampState) {
        lampIv.image = UIImage(named: lampState.rawValue)
        self.lampState = lampState
    }
}
