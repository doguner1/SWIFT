//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Doğu GNR on 2.07.2023.
//

import UIKit

class ViewController: UIViewController {


        @IBOutlet weak var imageView: UIImageView!
        //Görselimiz burada yer alıyor
        
        @IBOutlet weak var myLabel: UILabel!
        //Görseli detaylanduran bir metin
    
        var isJames = true
        
        override func viewDidLoad() {
            super.viewDidLoad()
           
            imageView.isUserInteractionEnabled = true
            //Resim tıklanabilir modunu aktif ediyoruz
            
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
            //Bir veya birden fazla tıklanmayı algılayabilen bir araç. Bu araç changePic fonksiyonu çağırıyor.
            //Yani resme her tıklandığında çağrılan fonksiyon çalışacak
            
            imageView.addGestureRecognizer(gestureRecognizer)
            //Yüklemiş olduğumuz resme bu yarattığımız aracı bağlamış olduk
            //Bu aracı tanımlamak istediğimiz her resme eklememiz gerekiyor
            
        }
        
        //Objektif fonksiyon istediğinden @objc yazdık
        //Orjinal bir fonksiyondan bir farkı yok
        @objc func changePic() {
            

            if isJames == true {
                imageView.image = UIImage(named: "lars")
                myLabel.text = "Lars Ulrich"
                isJames = false
            } else {
                imageView.image = UIImage(named: "james")
                myLabel.text = "James Hetfield"
                isJames = true
            }
            
            //Başlangıçta isJames true ve True ise resmini gösteriyor. Gösterdikten sonra değişkeni false yapıyor.
            //Fonksiyon tekrar resmi çağırdığında değişken false olduğunda bu sefer diğer resim gelecek.
            
        }


}

