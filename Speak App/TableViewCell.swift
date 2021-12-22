//
//  TableViewCell.swift
//  Speak App
//
//  Created by Deep Mahajan.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var lblWord: UILabel!
    @IBOutlet weak var imgViewCheckUnCheck: UIImageView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
