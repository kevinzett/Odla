//
//  MainScreenViewController.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-01-27.
//

import UIKit
import CoreData


class MainScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var tableView: UITableView!
    
    var tableViewCoreData = [Odlalist]()
    var rowSelected : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        setGardient()
      
//        let nib = UINib(nibName: "cellForList", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "cellforlist")
//        tableView.separatorStyle = .none
//        deleteAllData()
        setOptionsForVc()
        fetchList()
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchList()
    }
    
    func setOptionsForVc() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "cellForList", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cellforlist")
        tableView.separatorStyle = .none
    }
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Dina Odlingar"
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellforlist", for: indexPath) as! cellForList
        
        cell.cellLabelText.text = tableViewCoreData[indexPath.row].odlingname
        
//        cell.textLabel?.text = "Dina Odlingar"
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCoreData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "showinfovc") as? ShowInfoViewController else {return}
        vc.textForName = tableViewCoreData[indexPath.row].odlingname ?? "OdlingAlternativ"
        self.navigationController?.pushViewController(vc, animated: true)
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
    
    func fetchList() {
        let fetchRequest : NSFetchRequest<Odlalist> = Odlalist.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "indexnum >= %@ AND indexnum <= %@")
        do {
            self.tableViewCoreData = try context.fetch(fetchRequest)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            //error
        }
    }
    
    func deleteAllData() {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Odlalist")

            // Create Batch Delete Request
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

            do {
                try context.execute(batchDeleteRequest)

            } catch {
                // Error Handling
            }
        }
    
}


