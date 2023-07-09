//
//  DetailsController.swift
//  LandmarkBook
//
//  Created by Doğu GNR on 7.07.2023.
//

import UIKit

class DetailsController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var selectedMarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = selectedMarkImage
   
    }
    



}
