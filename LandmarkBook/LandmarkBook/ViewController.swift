//
//  ViewController.swift
//  LandmarkBook
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
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("1")
        landmarkNames.append("2")
        landmarkNames.append("3")
        landmarkNames.append("4")
        landmarkNames.append("5")
        landmarkNames.append("6")
        
        
        landmarkImages.append(UIImage(named: "1")!)
        landmarkImages.append(UIImage(named: "2")!)
        landmarkImages.append(UIImage(named: "3")!)
        landmarkImages.append(UIImage(named: "4")!)
        landmarkImages.append(UIImage(named: "5")!)
        landmarkImages.append(UIImage(named: "6")!)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//cell
        //Ne göstereceğiz
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        content.secondaryText = "Text"
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choseLandMarkImages = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "twoVc", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "twoVc"{
            let destinationVC = segue.destination as! DetailsController
            destinationVC.selectedMarkImage = choseLandMarkImages
        }
    }
}

