//
//  ViewController.swift
//  Game
//
//  Created by Doğu GNR on 2.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalText: UITextField!
    @IBOutlet weak var timerLabel: UILabel!
    
    var timerUp = Timer()
    var total2 = 0
    var counter = 4
    var counter2 : Int?
    var randomArray: [UILabel] = []
    var timerHid = Timer()
    var totalArray : [Int] = []
    var total = 0
    var boolean : Bool?
    var timerBoll = Timer()
    
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    @IBOutlet weak var myLabel4: UILabel!
    @IBOutlet weak var myLabel5: UILabel!
    @IBOutlet weak var myLabel6: UILabel!
    @IBOutlet weak var myLabel7: UILabel!
    @IBOutlet weak var myLabel8: UILabel!
    @IBOutlet weak var myLabel9: UILabel!
    @IBOutlet weak var myLabel10: UILabel!
    @IBOutlet weak var myLabel11: UILabel!
    @IBOutlet weak var myLabel12: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timerUp = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(timerU), userInfo: nil, repeats: true)
        
        timerHid = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(random), userInfo: nil, repeats: true)
        
        randomArray = [myLabel1,myLabel2,myLabel3,myLabel4,myLabel5,myLabel6,myLabel7,myLabel8,myLabel9,myLabel10,myLabel11,myLabel12]
        
        
    }
    
    func start(){
        if boolean == true{
            timerBoll = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        }else{
            timerLabel.isHidden = true
        }
    }
    
    @objc func random() {
        
        
        for randomAr in randomArray{
            let random = Int(arc4random_uniform(UInt32(101))) // 0 ile 100 arasında rastgele bir sayı üretiyor
            randomAr.text = String(random)
        }
        
        
        
        for hidden in randomArray{
            hidden.isHidden = true
        }
        
        
        var random =  Int(arc4random_uniform(UInt32(randomArray.count - 1)))
        
        random = Int(arc4random_uniform(UInt32(randomArray.count)))
        randomArray[random].isHidden = false
        
        if let label = randomArray[random] as? UILabel, let labelText = label.text, let labelIntValue = Int(labelText) {
            
            self.total +=  labelIntValue
        }
        
        
    }
    
    @objc func timerFunction() { //->Bu fonksiyon bir saniyede bir çağrılacak
        
        timerLabel.text = "Time: \(counter2)"
        counter2! -= 1
        
        if counter2 == -1 {
            timerBoll.invalidate()
            timerLabel.text = "Time's Over"
            makeAlert(titleInput: "SüreBitti", messageInput: "")
            
        }
        
        
    }
    
    @objc func timerU(){
        counter -= 1
        
        
        if counter == 0 {
            timerUp.invalidate()
            timerHid.invalidate()
            start()
            print(total)
            
            for loop  in randomArray{
                loop.isHidden = true
            }
        }
        
        
    }
    
    @IBAction func totalButton(_ sender: Any) {
        
            
            if totalText.text == String(total) { //username boş ise
                makeAlert(titleInput: "HEsaplanıyor", messageInput: "\(counter2!) Saniye kala Doğru")
                timerBoll.invalidate()
            }else{
                makeAlert(titleInput: "HEsaplanıyor", messageInput: "Yanlış")
            }
        }
        
        func makeAlert(titleInput: String, messageInput:String) {
                let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                //Fonksiyon tanımladık. Bu fonksiyonda iki string alan değişken
                //Bu değişkenlere göre fonksiyon çağırma da kullanıyoruz.
            }
    }

