//
//  DetailViewController.swift
//  Table
//
//  Created by TJ on 2022/06/12.
//

import UIKit

class DetailViewController: UIViewController {

    var receiveItem = ""
    var reciveImage = ""
    
    @IBOutlet weak var receiveLbl: UILabel!
    @IBOutlet weak var reciveImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receiveLbl.text = receiveItem
        reciveImageView.image = UIImage(named: reciveImage)
        // Do any additional setup after loading the view.
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
