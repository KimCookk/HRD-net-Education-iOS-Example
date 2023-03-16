//
//  ViewController.swift
//  FlowerCollectionView
//
//  Created by TJ on 2022/06/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var flowerCv: UICollectionView!
    
    var images = ["flower_01.png" , "flower_02.png" , "flower_03.png" , "flower_04.png" , "flower_05.png" , "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowerCv.dataSource = self
        flowerCv.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // if segue.identifier
    }
    


}

extension ViewController: UICollectionViewDataSource , UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        cell.flowerIv.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout{
    
    //cell 간의 상 하 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //cell 간의 좌우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 1
        let size = CGSize(width: width, height: width)
        return size
    }
    
}
