//
//  TwoViewController.swift
//  Game2
//
//  Created by Doğu GNR on 7.07.2023.
//

import UIKit

class TwoViewController: UIViewController {
    
    @IBOutlet weak var imageVc: UIImageView!
    
    var setImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        imageVc.image = setImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
