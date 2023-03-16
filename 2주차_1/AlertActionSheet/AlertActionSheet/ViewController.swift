//
//  ViewController.swift
//  AlertActionSheet
//
//  Created by TJ on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alertBtn: UIButton!
    @IBOutlet weak var actionSheetBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchShowBtn(_ sender: UIButton) {
        switch(sender)
        {
        case alertBtn:
            showAlert(alertStyle: UIAlertController.Style.alert)
            break
        case actionSheetBtn:
            showAlert(alertStyle: UIAlertController.Style.actionSheet)
            break
        default:
            break
        }
    }
    
    func showAlert(alertStyle: UIAlertController.Style)
    {
        
        let testAlert = UIAlertController(title: "Tilte", message: "Message", preferredStyle: alertStyle)
        
        let actionDefault = UIAlertAction(title: "Action Default", style: .default , handler: {ACTION in
            print("Default action called")
        })
        
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive , handler: {ACTION in
            print("Destructive action called")
        })
        
        let actionCancle = UIAlertAction(title: "Action Cancle", style: .cancel , handler: {ACTION in
            print("Cancle action called")
        })
        
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCancle)

        
        present(testAlert, animated: true , completion: nil)
        
    }
    func showActionSheet()
    {
       
        	
    }
    
}

