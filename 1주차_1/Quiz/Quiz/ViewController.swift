//
//  ViewController.swift
//  Quiz
//
//  Created by TJ on 2022/06/04.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tfFirstNumber: UITextField!
    @IBOutlet weak var tfSecondsNumber: UITextField!
    @IBOutlet weak var tfAddition: UITextField!
    @IBOutlet weak var tfSubtraction: UITextField!
    @IBOutlet weak var tfMultiplicator: UITextField!
    @IBOutlet weak var tfQuotient: UITextField!
    @IBOutlet weak var tfRemainder: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var btnCaculate: UIButton!

    @IBOutlet weak var scMode: UISegmentedControl!
    
    var calculateMode: String = "짝수모드"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblMessage.text?.removeAll()
        
        readOnly()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchBtnCaculate(_ sender: UIButton) {
        
        calculate()
    }
    
   
    @IBAction func changeScMode(_ sender: UISegmentedControl) {
        guard let checkString = scMode.titleForSegment(at: scMode.selectedSegmentIndex) else { return }
        calculateMode = checkString
    }
    
    
    func readOnly()
    {
        tfAddition.isUserInteractionEnabled = false
        tfSubtraction.isUserInteractionEnabled = false
        tfMultiplicator.isUserInteractionEnabled = false
        tfQuotient.isUserInteractionEnabled = false
        tfRemainder.isUserInteractionEnabled = false
    }
 
    func calculate()
    {
        guard let firestNumberString = tfFirstNumber.text else { return }
        guard let secondsNumberString = tfSecondsNumber.text else { return }
        
        let firestNumberCheck: Bool = checkNil(str: firestNumberString)
        let secondsNumberCheck: Bool = checkNil(str: secondsNumberString)
        
        if (firestNumberCheck && secondsNumberCheck)
        {
            calculation(firstNumberString: firestNumberString , secondNumberString: secondsNumberString)
        }
        else
        {
            if (!firestNumberCheck && !secondsNumberCheck)
            {
                lblMessage.text = "두 수를 입력해주세요."
            }
            else if secondsNumberCheck
            {
                lblMessage.text = "첫 번째 수를 입력해주세요."
            }
            else
            {
                lblMessage.text = "두 번째 수를 입력해주세요."
            }
        }
    }
    func calculation(firstNumberString: String , secondNumberString: String)
    {
        let firstNumber: Int = Int(firstNumberString)!
        let secondNumber: Int = Int(secondNumberString)!
        
        if(calculateMode == "짝수모드")
        {
            if(!(firstNumber % 2 == 0 && secondNumber % 2 == 0))
            {
                lblMessage.text = "두 수가 짝수인지 확인해주세요."
                return
            }
        }
        else if(calculateMode == "홀수모드")
        {
            if(!(firstNumber % 2 == 1 && secondNumber % 2 == 1))
            {
                lblMessage.text = "두 수가 홀수인지 확인해주세요."
                return
            }
        }
        
        lblMessage.text = "결과를 확인해주세요."

        tfAddition.text = String(firstNumber + secondNumber)
        tfSubtraction.text = String(firstNumber - secondNumber)
        tfMultiplicator.text = String(firstNumber * secondNumber)
        tfQuotient.text = String(firstNumber / secondNumber)
        tfRemainder.text = String(firstNumber % secondNumber)
    }
    
    func checkNil(str: String) -> Bool{
        let checkResult = str.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if checkResult.isEmpty{
            return false
        }else{
            return true
        }
    }
    
    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

   
    
}

