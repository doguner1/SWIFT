//
//  ViewController.swift
//  EkranlarArasıVeriAktarımı
//
//  Created by Doğu GNR on 1.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    var myName = ""
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1 function called")
    }
    
   
     override func viewDidDisappear(_ animated: Bool) {
         print("2 function called")
     }
     
     override func viewWillDisappear(_ animated: Bool) {
         print("3 function called")
     }
     
     override func viewWillAppear(_ animated: Bool) {
         print("4 function called")
         
     }
     
     override func viewDidAppear(_ animated: Bool) {
         print("5 function called")
     }


    @IBAction func ButtonClick(_ sender: Any) {
        myName = name.text!
        performSegue(withIdentifier: "twoVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "twoVC" {
               //Eğer gideceği segue nin identifier i nextCV ise bu işlemi yapacak
               //Bir sayfada aynı buton aynı sayfaya çıkartabilir
               //Aynı sayfaya çıkan butonların işlevlerini düzenlemek için bu önemli
               
               
               //as
               let destinationVC = segue.destination as! TwoViewController
               //segue.destination bana bir controller veriyor ama hangisi bilmiyoruz
               //o yüzden gideceği controllerin ismini verdik
               destinationVC.myLabel = myName
         
           }
           
           //segure olmadan hemen önce yapılacak işleri burada yazıyoruz.
           //Mesela bu sayfadan başka sınıfa geçen button tuşu bir segure işlemi yapar
       }
}


