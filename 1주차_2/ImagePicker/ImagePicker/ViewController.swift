//
//  ViewController.swift
//  ImagePicker
//
//  Created by TJ on 2022/06/05.
//

import UIKit

// : , extension 권장하지 않음
class ViewController: UIViewController {

    @IBOutlet weak var pvImage: UIPickerView!
    // weak , strong : 메모리 관련 / 앱이 Backgorund로 가는 경우 메모리를 기억해야겠다 -> strong
    @IBOutlet weak var lblPickImageName: UILabel!
    @IBOutlet weak var ivImageView: UIImageView!
    
    let MAX_ARRAY_NUM = 10      // 전체이미지 개수
    let PICKER_VIEW_COLUMN = 1  // PickerView의 컬럼 개수
    var imageArray = [UIImage?]()
    var imageFileName = ["w1.jpg","w2.jpg","w3.jpg","w4.jpg","w5.jpg","w6.jpg","w7.jpg","w8.jpg","w9.jpg","w10.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<MAX_ARRAY_NUM
        {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblPickImageName.text = imageFileName[0]
        ivImageView.image = imageArray[0]
        
        pvImage.dataSource = self
        pvImage.delegate = self
    }
}

extension ViewController: UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    func numberOfComponents(in pvImage: UIPickerView) -> Int{
        return PICKER_VIEW_COLUMN
    }
}

extension ViewController: UIPickerViewDelegate{
    // PickerView에 파일명 배치
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        return imageView
    }
    // PickerView로 선택된 파일명을 레이블 및 이미지뷰에 출력하기
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblPickImageName.text = imageFileName[row]
        ivImageView.image = imageArray[row]
    }
}



