//
//  AddViewController.swift
//  DBcrud
//
//  Created by TJ on 2022/07/02.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func touchInsertBtn(_ sender: UIButton) {
        let code = tfCode.text
        let name = tfName.text
        let dept = tfDept.text
        let phone = tfPhone.text
        
        if(!code!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
            let insertModel = InsertModel()
            let result = insertModel.insertItems(code: code!, name: name!, dept: dept!, phone: phone!)
            if(result){
                let resultAlert = UIAlertController(title: "Message", message: "정상적으로 입력이되었습니다.", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in self.navigationController?.popViewController(animated: true)})
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true)
            }else{
                let resultAlert = UIAlertController(title: "Message", message: "에러가 발생되었습니다.", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true)
            }
        }
        else
        {
            let resultAlert = UIAlertController(title: "Message", message: "학번을 입력해주세요.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
