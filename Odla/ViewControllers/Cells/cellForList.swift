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
    @IBOutlet weak var imageForCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ViewForCell.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        ViewForCell.layer.shadowColor = UIColor.black.cgColor
        ViewForCell.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        ViewForCell.layer.shadowOpacity = 0.4
        ViewForCell.layer.shadowRadius = 5.0        
    }
  
}
