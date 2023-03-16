//
//  ViewController.swift
//  ButtonName
//
//  Created by TJ on 2022/06/04.
//

import UIKit

// UIViewController 상속
class ViewController: UIViewController {

    // ! : Optional 의미 nil 존재 가능
    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet weak var btnChange: UIButton!
    
    @IBOutlet weak var lblImage: UILabel!
    @IBOutlet weak var lblAnimal: UILabel!
    
    
    @IBOutlet weak var btnDog: UIButton!
    @IBOutlet weak var btnPanda: UIButton!
    @IBOutlet weak var btnFox: UIButton!
    
    
    var count: Int = 0
    let imageContent: String = "🤔"
    
    let imoticonDog: String = "🐶"
    let imoticonPanda: String = "🐼"
    let imoticonFox: String = "🦊"

    
    // 화면이 띄어지기 전에 run
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblImage.text = imageContent
        // Do any additional setup after loading the view.
        
    }
    
       
    @IBAction func touchBtnChange(_ sender: UIButton) {
        let lblText = lblHello.text
        if(lblText == "Hello")
        {
            lblHello.text = "곤니찌와"
        }
        else if(lblText == "곤니찌와")
        {
            lblHello.text = "안녕하세요"
        }
        else if(lblText == "안녕하세요")
        {
            lblHello.text = "Hello"
        }
        count += 1
        btnChange.setTitle("Change\(count)", for: .normal)
    }
    
    @IBAction func touchBtnAdd(_ sender: UIButton) {
        lblImage.text! += imageContent
    }
    
    @IBAction func tochBtnAnimal(_ sender: UIButton) {
        
        var addAnimal: String = ""
        if(sender == btnDog)
        {
            addAnimal = imoticonDog
        }
        else if(sender == btnPanda)
        {
            addAnimal = imoticonPanda
        }
        else if (sender == btnFox)
        {
            addAnimal = imoticonFox
        }
        
        lblAnimal.text! += addAnimal
    }
    
}
// ViewController	


