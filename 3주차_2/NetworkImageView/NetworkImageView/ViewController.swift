//
//  ViewController.swift
//  NetworkImageView
//
//  Created by TJ on 2022/06/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchImgButton(_ sender: Any) {
        let url = URL(string: "https://zeushahn.github.io/Test/images/dog.jpg")
        let data = try? Data(contentsOf: url!)
        imgImageView.image = UIImage(data: data!)
    }
    
}

