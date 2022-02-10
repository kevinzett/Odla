//
//  OdlingsListaViewController.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-01-27.
//

import UIKit

class OdlingsListaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
   
    
    
    @IBOutlet weak var tableView: UITableView!
    var odlingsAlt = ["Morot", "Potatis", "Tomat", "Gurka", "Rädisa", "Morot", "Potatis", "Tomat", "Gurka", "Rädisa", "Morot", "Potatis", "Tomat", "Gurka", "Rädisa", "Morot", "Potatis", "Tomat", "Gurka", "Rädisa"]
    
    var filteredOdlingsAlt = [String]()
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
       
        filteredOdlingsAlt = odlingsAlt
        
        setOptionsForVc()
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        
    }
    
    
    
    func setOptionsForVc() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "cellForAddList", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cellforaddlist")
        tableView.separatorStyle = .none
    }

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
        filteredOdlingsAlt = odlingsAlt
        
        if searchText.isEmpty == false {
            filteredOdlingsAlt = odlingsAlt.filter({ $0.contains(searchText) })
        }
        tableView.reloadData()
    }

    
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellforaddlist", for: indexPath) as! cellForAddList
        cell.labelForCell.text = filteredOdlingsAlt[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredOdlingsAlt.count
    }
    
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "showinfovc") as! ShowInfoViewController
        vc.textForName = filteredOdlingsAlt[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
