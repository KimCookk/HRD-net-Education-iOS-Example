//
//  ViewController.swift
//  MutiplicationTable
//
//  Created by TJ on 2022/06/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var pvMultipleNumber: UIPickerView!
    @IBOutlet weak var tvMutilpleTable: UITextView!
    
    enum MultipleNumber : String{
        case NumberOne = "1단"
        case NumberTwo = "2단"
        case NumberThree = "3단"
        case NumberFour = "4단"
        case NumberFive = "5단"
        case NumberSix = "6단"
        case NumberSeven = "7단"
        case NumberEight = "8단"
        case NumberNine = "9단"
    }
    
    let multipleNumberArray = [MultipleNumber.NumberOne , MultipleNumber.NumberTwo ,MultipleNumber.NumberThree ,MultipleNumber.NumberFour ,MultipleNumber.NumberFive ,MultipleNumber.NumberSix ,MultipleNumber.NumberSeven ,MultipleNumber.NumberEight ,MultipleNumber.NumberNine]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblNumber.text = "1단"
        tvMutilpleTable.text = getMultipleTable(multipleNumber: 1)
        pvMultipleNumber.dataSource = self
        pvMultipleNumber.delegate = self

    }
    func getMultipleTable(multipleNumber:Int) -> String{
        var multipleTable = ""
        
        for index in 1...9
        {
            multipleTable += "\(multipleNumber) X \(index) = \(multipleNumber * index) \n"
        }
        
        return multipleTable
    }

}


extension ViewController: UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return multipleNumberArray.count
    }
    
    func numberOfComponents(in pvImage: UIPickerView) -> Int{
        return 1
    }
}

extension ViewController: UIPickerViewDelegate{
    // PickerView에 파일명 배치
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return multipleNumberArray[row].rawValue
    }
    
    
    // PickerView로 선택된 파일명을 레이블 및 이미지뷰에 출력하기
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tvMutilpleTable.text = getMultipleTable(multipleNumber: row + 1)
//         이런 식보다는 해당 데이터는 app 실행시 결정나는 값이므로
//         초기 실행시 2-9단 완성해놓고 빼오는 식으로 하는 것이 효율
        lblNumber.text = multipleNumberArray[row].rawValue
    }
}

