//
//  ViewController.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-01-27.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGardient()
        // Do any additional setup after loading the view.
    }

    func setGardient() {
        let gradientLayer = CAGradientLayer()
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = view.frame
        gradientLayer.colors = [
            
            UIColor(named: "greenfirstview")?.cgColor ?? UIColor.blue,
            UIColor(named: "greenfirstviewtwo")?.cgColor ?? UIColor.blue
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    
}

