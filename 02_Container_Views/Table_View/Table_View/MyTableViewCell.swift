//
//  MyTableViewCell.swift
//  Table_View
//
//  Created by Dux on 18/07/2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var titleImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
