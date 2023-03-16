//
//  ViewController.swift
//  TabBarPage
//
//  Created by TJ on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        let tabBarHeight: Double = 200
        self.tabBarController?.tabBar.frame.size.height = tabBarHeight
        self.tabBarController?.tabBar.frame.origin.y = view.frame.height - tabBarHeight
    }


}

