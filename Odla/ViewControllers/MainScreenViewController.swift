//
//  MainScreenViewController.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-01-27.
//

import UIKit

class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 

    @IBOutlet weak var tableView: UITableView!
    
    
    var textTry = ["hej", "Hejdå", "Hej Igen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        setGardient()
        
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Dina Odlingar"//textTry[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textTry.count
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
