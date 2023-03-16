//
//  ViewController.swift
//  ImageCollection
//
//  Created by TJ on 2022/06/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var uivFlower: UIImageView!
    @IBOutlet weak var uivPreViewFlower: UIImageView!
    @IBOutlet weak var uivBeforViewFlower: UIImageView!
    
    var pageIndex = 0
    var imageName = ["flower_01.png" , "flower_02.png" , "flower_03.png" , "flower_04.png" ,"flower_05.png" , "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeFlowerImage()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchBackButton(_ sender: UIButton) {
        pageIndex -= 1
        if(pageIndex < 0)
        {
            pageIndex = imageName.count-1
        }
        changeFlowerImage()
    }
    
    @IBAction func touchNextButton(_ sender: UIButton) {
        pageIndex += 1
        if(pageIndex > imageName.count - 1)
        {
            pageIndex = 0
        }
        changeFlowerImage()
    }
    func changeFlowerImage(){
        let index = pageIndex
        lblTitle.text = imageName[index]
        uivFlower.image = UIImage(named: imageName[index])
        changePreViewFlowerImage()
        changeBeforeViewFlowerImage()
    }
    func changePreViewFlowerImage()
    {
        var index = 0
        if(pageIndex == 5)
        {
            index = 0
        }
        else
        {
            index = pageIndex + 1
        }
        
        uivPreViewFlower.image = UIImage(named: imageName[index])
    }
    
    func changeBeforeViewFlowerImage() {
        var index = 0
        if(pageIndex == 0)
        {
            index = imageName.count - 1
        }
        else
        {
            index = pageIndex - 1
        }
        uivBeforViewFlower.image = UIImage(named: imageName[index])

    }
}

		
