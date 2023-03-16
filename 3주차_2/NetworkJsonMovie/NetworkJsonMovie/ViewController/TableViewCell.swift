//
//  TableViewCell.swift
//  NetworkJsonMovie
//
//  Created by TJ on 2022/06/19.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var firstStartIv: UIImageView!
    @IBOutlet weak var secondsStartIv: UIImageView!
    @IBOutlet weak var thirdStartIv: UIImageView!
    @IBOutlet weak var fourStartIv: UIImageView!
    @IBOutlet weak var fiveStartIv: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
