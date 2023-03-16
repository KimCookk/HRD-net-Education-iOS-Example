//
//  DetailViewController.swift
//  TableReview
//
//  Created by TJ on 2022/06/18.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageIv: UIImageView!
    @IBOutlet weak var itemLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemLbl.text = Message.item
        imageIv.image = UIImage(named: Message.itemImageFile)
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
