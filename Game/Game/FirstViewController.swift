//
//  FirstViewController.swift
//  Game
//
//  Created by Doğu GNR on 6.07.2023.
//

import UIKit

class FirstViewController: UIViewController {
    
    var bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func SureliClick(_ sender: Any) {
        performSegue(withIdentifier: "SüreliVC", sender: nil)
    }
    
    @IBAction func hard(_ sender: Any) {
        performSegue(withIdentifier: "hardSüreliVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               if segue.identifier == "SüreliVC" {
                   //Eğer gideceği segue nin identifier i nextCV ise bu işlemi yapacak
                   //Bir sayfada aynı buton aynı sayfaya çıkartabilir
                   //Aynı sayfaya çıkan butonların işlevlerini düzenlemek için bu önemli
                   
                   
                   //as
                   let destinationVC = segue.destination as! ViewController
                   //segue.destination bana bir controller veriyor ama hangisi bilmiyoruz
                   //o yüzden gideceği controllerin ismini verdik
                   destinationVC.boolean = bool
                   destinationVC.counter2 = 10
             
               }else if segue.identifier == "hardSüreliVC"{
                   let destinationVC = segue.destination as! ViewController
                   //segue.destination bana bir controller veriyor ama hangisi bilmiyoruz
                   //o yüzden gideceği controllerin ismini verdik
                   destinationVC.boolean = bool
                   destinationVC.counter2 = 3
               }
               
               //segure olmadan hemen önce yapılacak işleri burada yazıyoruz.
               //Mesela bu sayfadan başka sınıfa geçen button tuşu bir segure işlemi yapar
           }
    
    
  
    
}
