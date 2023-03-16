//
//  DetailViewController.swift
//  AnimalTable
//
//  Created by TJ on 2022/06/18.
//

import UIKit

class AnimalDetailViewController: UIViewController {

    
    @IBOutlet weak var animalIv: UIImageView!
    @IBOutlet weak var animalTv: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animal = SegueMessage.animalMessage
        animalIv.image = UIImage(named: animal.image)
        animalTv.text = animal.print()

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
