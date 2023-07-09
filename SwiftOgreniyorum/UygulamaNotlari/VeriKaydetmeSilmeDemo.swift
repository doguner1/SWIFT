//
//  VeriKaydetmeDemo.swift
//  SwiftOgreniyorum
//
//  Created by Doğu GNR on 28.06.2023.
//

@IBOutlet weak var nameText: UITextView!
@IBOutlet weak var birthText: UITextView!
@IBOutlet weak var nameLabel: UITextView!
@IBOutlet weak var birthLabel: UITextView!

/*
 Burada nameText Kullanıcının adını girdiği alan
 birtText kullanıcın doğum tarihini girdiği alan
 nameLabel girilen değere göre kayıt edilen Text alanı
 birthLabel girilen değere göre kayıt edilen Text alanı
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirht = UserDefaults.standard.object(forKey: "birth")
        //Burada veriler obsiyoneldir çünkü uygulama ilk açıldığında içi boş olacak ama patlamayacak
        
        
        //Casting - as? vs. as!
        nameLabel.text = storedName as? String
        //StoredName i becerebilirsen String e çevir demek
        birthLabel.text = storedBirht as? String
        //StoredBirt i becerebilirsen String e çevir demek
    
        
        
        if let newName = storedName as? String{
            nameLabel.text = "Name: \(newName)"
        }
        
        if let newBirth = storedBirht as? String{
            birthLabel.text = "Birthday: \(newBirth)"
        }
        //Bu kullanım yukardakine göre daha güvenli oldu
    }


}

@IBAction func saveClicked(_ sender: Ayn) {
    
    UserDefaults.standard.set(nameText.text!, forKey: "name")
    UserDefaults.standard.set(birthText.text!, forKey: "birth")
    /*
     Burada save butuna bastıktan sonra kullanıcın girdiği ad ve doğum günü
         kayıt altına alındı. forKey dediği alan, kayıttaki verinizi
            çağırmakta kullanıyoruz. Ek olarak program başladığında
                bu kayıt gelmesi için gerekli yere ekleme yapılmalı
     */
    
    
    nameLabel.text = "Name: \(nameText.text!)"
    birthLabel.text = "Birhday: \(birthText.text!)"
    //Burada ünlem kullandık yani text gelecek dedik. Boş bile olsa "" olur.
}



//Veri Silme

@IBAction func deleteClicked(_ sender: Any){
    let storedName = UserDefaults.standard.object(forKey: "name")
    let storedBirth = UserDefaults.standard.object(forKey: "birth")
    
    if (storedName as? String) != nil {
        UserDefaults.standard.removeObject(forKey: "name")
        nameLabel.text = "Name: "
    }
    /*storedName in String e çevrilmiş hali boş değil ise
      ->Kayıt edilen yerden anahtarın değerini sil
      ->Yeni değeri girildi.
     */
    
    if (storedBirth as? String) != nil {
        UserDefaults.standard.removeObject(forKey: "birht")
        birthLabel.text = "Birthday: "
    }
    /*storedBirth in String e çevrilmiş hali boş değil ise
      ->Kayıt edilen yerden anahtarın değerini sil
      ->Yeni değeri girildi.
     */
}
