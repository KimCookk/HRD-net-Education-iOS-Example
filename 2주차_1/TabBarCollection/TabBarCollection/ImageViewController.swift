//
//  ViewController.swift
//  ImageAutoCollection
//
//  Created by TJ on 2022/06/05.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var lblUpperTitle: UILabel!
    @IBOutlet weak var lblUpperFlowerName: UILabel!
    @IBOutlet weak var uibUpperFlower: UIImageView!
    
    
    @IBOutlet weak var lblDownTitle: UILabel!
    @IBOutlet weak var lblDownFlowerName: UILabel!
    @IBOutlet weak var uibDownFlower: UIImageView!
    
    @IBOutlet weak var tfSetInterval: UITextField!
    
    var imageUpperIndex = 0
    var imageDownIndex = 0
    var imageName = ["flower_01.png" , "flower_02.png" , "flower_03.png", "flower_04.png" , "flower_05.png" , "flower_06.png"]
    
    var initInterval = 1.0
    var timeCount = 0
    
    let timeSelector: Selector = #selector(ImageViewController.updateTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        updateFlowerImageView()
        Timer.scheduledTimer(timeInterval: initInterval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    func updateFlowerImageView()
    {
        
        let upperName = imageName[imageUpperIndex]
        lblUpperFlowerName.text = upperName
        uibUpperFlower.image = UIImage(named: upperName)
        
        let downName = imageName[imageDownIndex]
        lblDownFlowerName.text = downName
        uibDownFlower.image = UIImage(named: downName)
    }
    
    @objc func updateTime()
    {
        imageUpperIndex += 1
        timeCount += 1
        
        if(timeCount % 3 == 0)
        {
            imageDownIndex += 1
        }
        
        if(imageUpperIndex > imageName.count - 1)
        {
            imageUpperIndex = 0
        }
        
        if(imageDownIndex > imageName.count - 1)
        {
            imageDownIndex = 0
        }
        updateFlowerImageView()
    }
    
}

