//
//  ViewController.swift
//  CirkinHesapMakinesi
//
//  Created by Doğu GNR on 27.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sonuc: UILabel!
    
    @IBOutlet weak var num1: UITextField!
    @IBOutlet weak var num2: UITextField!
    
    @IBAction func arti(_ sender: Any) {
        if let first = Int(num1.text!){
            if let second = Int(num2.text!){
                var result = first + second
                sonuc.text = String(result)
            }else{
                sonuc.text = "!!!!"
            }
        }else{
            sonuc.text = "!!!!"
        }
    }
    
    @IBAction func eksi(_ sender: Any) {
        if let first = Int(num1.text!){
            if let second = Int(num2.text!){
                var result = first - second
                sonuc.text = String(result)
            }else{
                sonuc.text = "!!!!"
            }
        }else{
            sonuc.text = "!!!!"
        }
    }
    
    @IBAction func carpma(_ sender: Any) {
        if let first = Int(num1.text!){
            if let second = Int(num2.text!){
                var result = first * second
                sonuc.text = String(result)
            }else{
                sonuc.text = "!!!!"
            }
        }else{
            sonuc.text = "!!!!"
        }
    }
    
    @IBAction func bolme(_ sender: Any) {
        if let first = Int(num1.text!){
            if let second = Int(num2.text!){
                var result = Double(first) / Double(second)
                sonuc.text = String(result)
            }else{
                sonuc.text = "!!!!"
            }
        }else{
            sonuc.text = "!!!!"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

