//
//  ViewController.swift
//  ImoticonMessage
//
//  Created by TJ on 2022/06/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvMessageView: UITextView!
    @IBOutlet weak var tfSendMessage: UITextField!
    
    @IBOutlet weak var btnDog: UIButton!
    @IBOutlet weak var btnTiger: UIButton!
    @IBOutlet weak var btnCow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func checkNil(str: String)  -> String{
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if check.isEmpty{
            return ""
        }
        else{
            return check
        }
    }
    @IBAction func TouchBtnImoticon(_ sender: UIButton) {
        
        var message: String = checkNil(str: tfSendMessage.text!)
        
        if(sender == btnDog)
        {
            message += "🐶"
        }
        else if(sender == btnTiger)
        {
            message += "🐯"
        }
        else if(sender == btnCow)
        {
            message += "🐮"
        }
        
        tfSendMessage.text = message
    }
    
    @IBAction func TouchBtnSend(_ sender: UIButton) {
        
        tvMessageView.text = tvMessageView.text + "\n" + tfSendMessage.text!
        tfSendMessage.text?.removeAll()

    }
}

