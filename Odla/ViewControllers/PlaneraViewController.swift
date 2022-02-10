//
//  PlaneraViewController.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-01-27.
//

import UIKit

class PlaneraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setGardient()
        
    }
    

    func setGardient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.frame
        gradientLayer.colors = [
            
            UIColor(named: "greenfirstview")?.cgColor ?? UIColor.blue,
            UIColor(named: "greenfirstviewtwo")?.cgColor ?? UIColor.blue
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

}
