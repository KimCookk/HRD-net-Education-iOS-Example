//
//  ViewController.swift
//  BMIMesur
//
//  Created by TJ on 2022/06/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    
    
    @IBOutlet weak var lblResultMessage: UILabel!
    @IBOutlet weak var ivBMIImage: UIImageView!
    
    let bmiConst = 1.7
    
    enum BMIType : String
    {
        case normal = "normal.png"
        case obese = "obese.png"
        case overweight = "overweight.png"
        case risk = "risk.png"
        case underweight = "underweight.png"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblResultMessage.text = "측정 값을 입력해주시오."
        ivBMIImage.image = UIImage(named: "bmi.png")
        
        // Do any additional setup after loading the view.
    }

    @IBAction func changetfInput(_ sender: UITextField) {
        
        var height = Double(checkNil(str: tfHeight.text))
        var weight = Double(checkNil(str: tfWeight.text))

        if(( height != 0 ) && ( weight != 0 ))
        {
            let bmi = calculateBMI(inputHeight: height!, inputWeight: weight!)
            updateBmiImage(inputBMI: bmi)
        }
    }
    
    func calculateBMI(inputHeight: Double , inputWeight: Double) -> Double
    {
        let result: Double = inputWeight / (( inputHeight / 100) * bmiConst)
        
        return result
    }
    
    func updateBmiImage(inputBMI: Double)
    {
        
        var bmiType: String = "저체중"
        var type: BMIType = BMIType.underweight
        var fontColor: UIColor = UIColor.blue
        
        
        if(inputBMI > 18.5 && inputBMI < 22.9)
        {
            type = BMIType.normal
            bmiType = "정상체중"
            fontColor = UIColor.green
        }
        else if(inputBMI > 23 && inputBMI < 24.9 )
        {
            type = BMIType.risk
            bmiType = "과체중"
            fontColor = UIColor.yellow
        }
        else if(inputBMI > 25 && inputBMI < 29.9)
        {
            type = BMIType.overweight
            bmiType = "비만"
            fontColor = UIColor.orange
        }
        else if(inputBMI > 30)
        {
            type = BMIType.obese
            bmiType = "고도비만"
            fontColor = UIColor.red
        }
        
        let bmiImage = type.rawValue
        
        let digit: Double = pow(10, 3)
        let message = "귀하의 bmi 수치는 \(round(inputBMI*digit)/digit) 이며, \(bmiType) 에 해당됩니다."
        
        ivBMIImage.image = UIImage(named: bmiImage)
        lblResultMessage.text = message
        lblResultMessage.textColor = fontColor
        
    }
    
    func checkNil(str: String?) -> String
    {
      
        guard let check = str else
        {
            return "0"
        }
        if(check.isEmpty)
        {
            return "0"
        }
        
        return check
    }
    
}

