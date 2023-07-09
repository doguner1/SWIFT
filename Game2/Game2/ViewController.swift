//
//  ViewController.swift
//  Game2
//
//  Created by Doğu GNR on 7.07.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var choseLandMarkImages = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        landmarkNames.append("CigoliEşşeği")
        landmarkNames.append("AnkaraHorozu")
        landmarkNames.append("MinnoşKedi")
        
        landmarkImages.append(UIImage(named: "miraç")!)
        landmarkImages.append(UIImage(named: "tolu")!)
        landmarkImages.append(UIImage(named: "dodo")!)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Ne göstereceğiz
                let cell = UITableViewCell()
                var content = cell.defaultContentConfiguration()
                content.text = landmarkNames[indexPath.row]
                content.secondaryText = "Gerçektir"
                cell.contentConfiguration = content
                return cell
                //content.text alanı Table view sütünların ismi oldu
                //secondaryText kısmı ise alt isimleri gibi ikinci isimleri oldu
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           choseLandMarkImages = landmarkImages[indexPath.row]
           performSegue(withIdentifier: "twoVc", sender: nil)
           //Eğer twoVc ye gidiyor ise yapılacakları alt fonksiyonda belirttik
       }
       
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "twoVc"{
               let destinationVC = segue.destination as! TwoViewController
               destinationVC.setImage = choseLandMarkImages
               //diğer ekrandaki resmi değiştirdik
           }
       }

}

