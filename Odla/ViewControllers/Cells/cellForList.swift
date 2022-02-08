//
//  cellForList.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-02-03.
//

import UIKit


class cellForList: UITableViewCell {
    @IBOutlet weak var cellLabelText: UILabel!
    @IBOutlet weak var ViewForCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ViewForCell.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
}
