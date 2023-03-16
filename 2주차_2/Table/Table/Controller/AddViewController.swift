//
//  AddViewController.swift
//  Table
//
//  Created by TJ on 2022/06/12.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var imagePv: UIPickerView!
    @IBOutlet weak var addTf: UITextField!
    
    var images: [String] = []
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePv.dataSource = self
        imagePv.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddTouch(_ sender: UIButton) {
        
        let inputText = addTf.text ?? ""
        
        
        if(!inputText.isEmpty)
        {
            Message.selectedImage = images[selectedIndex]
            Message.item = inputText
            Message.isADD = true
        }
        
        navigationController?.popViewController(animated: true)
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

extension AddViewController: UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        images.count
    }
    
    
}

extension AddViewController: UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: UIImage(named: images[row]))
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        return imageView
    }
    // PickerView로 선택된 파일명을 레이블 및 이미지뷰에 출력하기
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedIndex = row
    }
}
