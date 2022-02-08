//
//  GradiantButton.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-02-02.
//

import Foundation
import UIKit

class GradientButton: UIButton{
    let gradient = CAGradientLayer()
   

        init(colors: [CGColor]) {
            super.init(frame: .zero)
        gradient.frame = bounds
        gradient.colors = colors
        layer.addSublayer(gradient)
        }
    

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
    
}
