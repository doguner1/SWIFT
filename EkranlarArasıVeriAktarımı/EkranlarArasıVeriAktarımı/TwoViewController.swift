//
//  TwoViewController.swift
//  EkranlarArasıVeriAktarımı
//
//  Created by Doğu GNR on 1.07.2023.
//

import UIKit

class TwoViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var myLabel = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       
        nameLabel.text = myLabel
    }
    

}
