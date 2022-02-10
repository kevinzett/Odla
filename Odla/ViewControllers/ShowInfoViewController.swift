//
//  ShowInfoViewController.swift
//  Odla
//
//  Created by Kevin Zetterlind on 2022-01-28.
//

import UIKit
import CoreData



class ShowInfoViewController: UIViewController {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var imageViewOmSort: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var infoTextView: UITextView!

    var textForName = ""
    var textForInfo = ""
    var stringTextForImage = ""
    
    var informationForText = infoForText()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tableViewCoreData = [Odlalist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOptionsAndStyle()
        nameText.text = textForName
        checkInfoText()
        
    }
    
    func checkInfoText() {
        switch textForName {
        case "Morot":
            textForInfo = informationForText.infoText[0]
            stringTextForImage = "morotter"
            
        case "Potatis":
            textForInfo = informationForText.infoText[1]
            stringTextForImage = "potatis"

        case "Tomat":
            textForInfo = informationForText.infoText[2]
            stringTextForImage = "tomat"

        case "Gurka":
            textForInfo = informationForText.infoText[3]
            stringTextForImage = "gurka"

        case "Rädisa":
            textForInfo = informationForText.infoText[4]
            stringTextForImage = "rädisa"
            
        default:
            textForName = "Greens"
        }
        infoTextView.text = textForInfo
        imageViewOmSort.image = UIImage(named: stringTextForImage)
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
        
        addButton.backgroundColor = UIColor(named: "greenfirstview")
        addButton.layer.cornerRadius = 22
        addButton.layer.borderWidth = 25
        addButton.layer.masksToBounds = false
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        addButton.layer.shadowOpacity = 0.6
        addButton.layer.shadowRadius = 5.0
        addButton.layer.borderColor = UIColor.clear.cgColor
//        addButton.layer.backgroundColor = UIColor.systemBackground.cgColor
        
    }

    
    @IBAction func addButtonTap(_ sender: Any) {
        let newOdlaListItem = Odlalist(context: self.context)
        newOdlaListItem.odlingname = nameText.text
        newOdlaListItem.nameforimage = nameText.text
        newOdlaListItem.indexnum = Int64(tableViewCoreData.count + 1)
        navigationController?.popViewController(animated: true)
        
        do {
            try self.context.save()
        } catch {
            print(error)
        }
    }
}
