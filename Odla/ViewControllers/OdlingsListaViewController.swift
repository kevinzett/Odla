//
//  OdlingsListaViewController.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-01-27.
//

import UIKit

class OdlingsListaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var odlingsAlt = ["Morot", "Potatis", "Tomat", "Gurka", "Rädisa", "Morot", "Potatis", "Tomat", "Gurka", "Rädisa", "Morot", "Potatis", "Tomat", "Gurka", "Rädisa", "Morot", "Potatis", "Tomat", "Gurka", "Rädisa"]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setOptionsForVc()
        // Do any additional setup after loading the view.
    }
    
    func setOptionsForVc() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "cellForAddList", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cellforaddlist")
        tableView.separatorStyle = .none
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "celltwo", for: indexPath)
//        cell.textLabel?.text = odlingsAlt[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellforaddlist", for: indexPath) as! cellForAddList
        
        cell.labelForCell.text = odlingsAlt[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return odlingsAlt.count
    }
    
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "showinfovc") as! ShowInfoViewController
        vc.textForName = odlingsAlt[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    


}
