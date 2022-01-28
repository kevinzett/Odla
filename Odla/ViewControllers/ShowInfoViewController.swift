//
//  ShowInfoViewController.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-01-28.
//

import UIKit

class ShowInfoViewController: UIViewController {
    @IBOutlet weak var imageViewOmSort: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOptionsAndStyle()
    }
    func setGardient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [
            
            UIColor(named: "firstviewcolorbutton")?.cgColor ?? UIColor.blue,
            UIColor(named: "firstviewcolorbuttontwo")?.cgColor ?? UIColor.blue
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    func setOptionsAndStyle() {
        setGardient()
        imageViewOmSort.layer.cornerRadius = 20
    }
    
}
