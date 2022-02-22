//
//  cellForAddList.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-02-07.
//

import UIKit

class cellForAddList: UITableViewCell {
    
    
    @IBOutlet weak var imageForCell: UIImageView!
    @IBOutlet weak var viewForCell: UIView!
    @IBOutlet weak var labelForCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewForCell.layer.cornerRadius = 15
        viewForCell.layer.shadowColor = UIColor.black.cgColor
        viewForCell.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        viewForCell.layer.shadowOpacity = 0.4
        viewForCell.layer.shadowRadius = 5.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
