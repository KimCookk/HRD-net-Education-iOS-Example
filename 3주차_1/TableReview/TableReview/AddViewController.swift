//
//  AddViewController.swift
//  TableReview
//
//  Created by TJ on 2022/06/18.
//

import UIKit

class AddViewController: UIViewController {

    
    
    @IBOutlet weak var pickerPv: UIPickerView!
    @IBOutlet weak var ImageIv: UIImageView!
    @IBOutlet weak var addItemTf: UITextField!
    
    let maxArrayNum = 3
    let pickerViewColumn = 1
    let pickerViewHeight: CGFloat = 40
    // CGFloat : Computer Graphic Float
    
    var imageArray = [UIImage?]()
    var imageFile = ["cart.png" , "clock.png" , "pencil.png"]
    
    var fileName = "" // pickerView 선택 된 file Name
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInit()
        // Do any additional setup after loading the view.
    }
    
    func dataInit()
    {
        for i in 0 ..< maxArrayNum{
            let image = UIImage(named: imageFile[i])
            imageArray.append(image)
            
        }
        
        ImageIv.image = imageArray[0]
        
        pickerPv.dataSource = self
        pickerPv.delegate = self
        
        fileName = imageFile[0]
        
    }
    

    @IBAction func touchAddBtn(_ sender: Any) {
        if addItemTf.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        {
            Message.check = "Old"
        }
        else
        {
            Message.check = "New"
            Message.item = addItemTf.text!
            Message.itemImageFile = fileName
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

// PickerView Extension
extension AddViewController: UIPickerViewDataSource{
    
    // Column에 대한 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerViewColumn
    }
        
    // Row 에 대한 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFile.count
    }
    
    
}
extension AddViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        return imageView
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerViewHeight
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ImageIv.image = imageArray[row]!
        fileName = imageFile[row]
    }
}
