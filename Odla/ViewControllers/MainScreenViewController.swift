//
//  MainScreenViewController.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-01-27.
//

import Foundation
import UIKit
import CoreData
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
import CoreLocation


class MainScreenViewController: UIViewController, CLLocationManagerDelegate {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let apiKey = "67899f40b6720a812f6bf110ac4e4e31"
    var lat =  11.343444
    var lon = 104.33332
    var activityIndicator: NVActivityIndicatorView!
    let locationManager = CLLocationManager()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var currentDayLabel: UILabel!
    @IBOutlet weak var celciusLabel: UILabel!
    
    var tableViewCoreData = [Odlalist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        deleteAllData()
        setOptionsForVc()
        fetchList()
        
        let indicatorSize: CGFloat = 70
        let indicatorFrame = CGRect(x: (view.frame.width-indicatorSize)/2, y: (view.frame.height-indicatorSize)/2, width: indicatorSize, height: indicatorSize)
        activityIndicator = NVActivityIndicatorView(frame: indicatorFrame, type: .lineScale, color: UIColor.white, padding: 20.0)
        activityIndicator.backgroundColor = UIColor.black
        view.addSubview(activityIndicator)
        
        locationManager.requestWhenInUseAuthorization()
        
        activityIndicator.startAnimating()
        if(CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchList()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        lat = location.coordinate.latitude
        lon = location.coordinate.longitude
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric").responseJSON {
            response in
            self.activityIndicator.stopAnimating()
            if let responseStr = response.result.value {
                let jsonResponse = JSON(responseStr)
                let jsonWeather = jsonResponse["weather"].array![0]
                let jsonTemp = jsonResponse["main"]
                let iconName = jsonWeather["icon"].stringValue
                
//                self.weatherImageView.image = UIImage(named: iconName)
                self.celciusLabel.text = "\(Int(round(jsonTemp["temp"].doubleValue)))°C"
                
                let date = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "EEEE"
                self.currentDayLabel.text = dateFormatter.string(from: date)
                switch self.currentDayLabel.text {
                case "Monday":
                    self.currentDayLabel.text = "Måndag"
                    
                case "Tuesday":
                    self.currentDayLabel.text = "Tisdag"

                case "Wednesday":
                    self.currentDayLabel.text = "Onsdag"

                case "Thursday":
                    self.currentDayLabel.text = "Torsdag"

                case "Friday":
                    self.currentDayLabel.text = "Fredag"
                    
                case "Saturday":
                    self.currentDayLabel.text = "Lördag"
                    
                case "Sunday":
                    self.currentDayLabel.text = "Söndag"
                    
                default:
                    self.currentDayLabel.text = "Weekday"
                }
            }
        }
    }
    
    func setOptionsForVc() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "cellForList", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cellforlist")
        tableView.separatorStyle = .none
    }
    
    
    func fetchList() {
        let fetchRequest : NSFetchRequest<Odlalist> = Odlalist.fetchRequest()
        
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
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

            do {
                try context.execute(batchDeleteRequest)

            } catch {
                // error
            }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "showinfovc") as! ShowInfoViewController
        vc.textForName = tableViewCoreData[indexPath.row].odlingname ?? "OdlingAlternativ"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Dina Odlingar"
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellforlist", for: indexPath) as! cellForList
        
        cell.cellLabelText.text = tableViewCoreData[indexPath.row].odlingname
        cell.imageForCell.image = UIImage(named: tableViewCoreData[indexPath.row].odlingname ?? "Potatis")
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCoreData.count
    }

}

