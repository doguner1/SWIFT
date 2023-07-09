//
//  ViewController.swift
//  TimerProject
//
//  Created by Doğu GNR on 2.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    //Burası düz bir label oluşturduğumuz alan
      
      var timer = Timer()
      //Timer sınıfımız
      var counter = 0

      override func viewDidLoad() {
          super.viewDidLoad()
          
          counter = 10
          timeLabel.text = "Time: \(counter)"
          
          timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
          //Planlanmış Timer demek
          //1 saniyede bir
          //TimerFunction fonksiyonunu çağırıyor
          //Tekrar etme modu açık
          
          
      }
      
      @objc func timerFunction() { //->Bu fonksiyon bir saniyede bir çağrılacak
          
          timeLabel.text = "Time: \(counter)"
          counter -= 1
          
          if counter == 0 {
              timer.invalidate()
              timeLabel.text = "Time's Over"
          }
          
          
      }
      

      @IBAction func buttonClicked(_ sender: Any) {
          
          print("button clicked")
      }
      
}

//Thread.sleep(forTimeInterval: 1)
//->> Bir saniye programı uyut demek
