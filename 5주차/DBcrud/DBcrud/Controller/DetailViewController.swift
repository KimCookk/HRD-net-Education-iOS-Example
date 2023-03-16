//
//  DetailViewController.swift
//  DBcrud
//
//  Created by TJ on 2022/07/02.
//

import UIKit



class DetailViewController: UIViewController {

    @IBOutlet weak var codeTf: UITextField!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var deptTf: UITextField!
    @IBOutlet weak var phoneTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeTf.text = Message.scode
        nameTf.text = Message.sname
        deptTf.text = Message.sdept
        phoneTf.text = Message.sphone
        
        codeTf.isUserInteractionEnabled = false

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchEditBtn(_ sender: UIButton) {
        let scode = codeTf.text
        let sname = nameTf.text
        let sdept = deptTf.text
        let sphone = phoneTf.text
        
        let requestAlert = UIAlertController(title: "Message", message: "정말 \(scode!)를 수정하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
            self.updateStudent(scode: scode!, sname: sname!, sdept: sdept!, sphone: sphone!)
            })
        let cancleAction = UIAlertAction(title: "NO", style: .default, handler: nil)
        requestAlert.addAction(okAction)
        requestAlert.addAction(cancleAction)
        present(requestAlert, animated: true)
    }
    
    @IBAction func touchDeleteBtn(_ sender: UIButton) {
        
        let scode = codeTf.text

        
        let requestAlert = UIAlertController(title: "Message", message: "정말 \(scode!)를 삭제하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
            self.deleteStudent(scode: scode!)
            })
        let cancleAction = UIAlertAction(title: "NO", style: .default, handler: nil)
        requestAlert.addAction(okAction)
        requestAlert.addAction(cancleAction)
        present(requestAlert, animated: true)
    }
    
    func deleteStudent(scode: String)
    {
        let deleteModel = DeleteModel()
        if(deleteModel.deleteItems(code: scode))
        {
            let resultAlert = UIAlertController(title: "Message", message: "정상적으로 삭제 되었습니다.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in self.navigationController?.popViewController(animated: true)})
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true)
        }
        else
        {
            let resultAlert = UIAlertController(title: "Message", message: "에러가 발생되었습니다.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true)
        }
    }
    
    func updateStudent(scode: String , sname: String , sdept: String , sphone: String)
    {
        let updateModel = UpdateModel()
        if(updateModel.updateItems(code: scode, name: sname, dept: sdept, phone: sphone))
        {
            let resultAlert = UIAlertController(title: "Message", message: "정상적으로 수정되었습니다.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in self.navigationController?.popViewController(animated: true)})
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true)
        }
        else
        {
            let resultAlert = UIAlertController(title: "Message", message: "에러가 발생되었습니다.", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
    

}
