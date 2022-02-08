//
//  cellForAddList.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-02-07.
//

import UIKit

class cellForAddList: UITableViewCell {
    
    
    @IBOutlet weak var viewForCell: UIView!
    @IBOutlet weak var labelForCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewForCell.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
