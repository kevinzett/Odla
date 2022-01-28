//
//  OdlingsListaViewController.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-01-27.
//

import UIKit

class OdlingsListaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var textTry = ["1", "2", "3", "4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setGardient()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
       
        // Do any additional setup after loading the view.
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celltwo", for: indexPath)
        cell.textLabel?.text = "OdlingsAlternativ"//textTry[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textTry.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "showinfovc") as! ShowInfoViewController
        navigationController?.pushViewController(vc, animated: true)
//        let vcNagivagtionController = UINavigationController(rootViewController: vc)
//        vcNagivagtionController.modalPresentationStyle = .fullScreen
        
//        self.present(vcNagivagtionController, animated: true, completion: nil)

//        let secondVC = ShowInfoViewController()
//        navigationController?.pushViewController(ShowInfoViewController(), animated: true)
    }


}
