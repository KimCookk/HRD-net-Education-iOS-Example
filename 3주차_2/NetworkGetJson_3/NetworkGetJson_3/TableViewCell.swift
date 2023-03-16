//
//  TableViewCell.swift
//  NetworkGetJson_2
//
//  Created by TJ on 2022/06/19.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellPhoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    @IBAction func touchCellButton(_ sender: Any) {
        let alert = UIAlertController(title: "Info", message: cellPhoneLabel.text, preferredStyle: .alert)
        
        alert.present( alert, animated: true)
    }
    
}
