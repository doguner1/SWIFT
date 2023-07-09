import UIKit

var greeting = "Hello, playground"
//Değiştirilebilir
let greeting2 = "Hello world"
//Değiştirilemez




var userName = "Doğu"
userName.append("GNR")
//Sonuna GNR ekledi => DoğuGNR
userName.lowercased()
//Hepsini küçük harf ile yazdı => doğugnr
userName.uppercased()
//Hepsini büyük harf ile yazdı => DOĞUGNR




let myString : String = "50"
var Number : Int = 10
//Değişken tipini önceden belirtme
let stringNumber : String = String(20)
//int 20 değeri String oldu




//define
let myVariable : String   //->Değişken tanımladık, değeri atamadık. Define
//initialization
myVariable = "Test"      //->Değişkene değeri atatık. Initialization
myVariable.uppercased()




let myVariable2 : String
myVariable2 = "Test2"
let myUpperVariable = myVariable2.uppercased()
print(myVariable2)      //-> Test2
print(myUpperVariable)  //-> TEST2




//-------DİZİ------
var myFavoriteMovies = ["Recep İvedik", "The100","ABC"]
//Dizi
myFavoriteMovies[0].uppercased()
//Any Objesi olmadığından dizinin indeksini çağırdıktan sonra değiştirme yapılabildi
myFavoriteMovies.count
//Eleman sayısını gösteriyor
myFavoriteMovies[myFavoriteMovies.count - 2]
//Dinamik olarak sonran 2. elemanı getiriyor
myFavoriteMovies.last
//Son elemanı getiriyor
myFavoriteMovies.sort()
//Alfabetik sıralıyor
myFavoriteMovies.append("DBE")
//Eleman ekleme fonksiyonu

var myFavoriteMoviesAs = ["Recep İvedik", "The100","ABC",5,10.3,true] as [Any]
//Any objesi olduğundan dizinin ilk elemanını getir ve uppercase yap diyemeyiz




//-------SET------
var mySet : Set = [1,2,3,4,5,1,2,3]
/*SET dizi gibidir. Ama son eleman ilk eleman gibi index olayı yoktur.
 Set bir veriyi yazdırırken tekrar eden elememanları yazmayacaktır.
 İnternetten bir veriyi set e atarsak ve yazdırırsak, tekrarlanmış veriler bir kez yazılacaktır
 */
var myInternetArray = [1,2,3,4,5,1,2,3]
var myInternetSet = Set(myInternetArray)
print(myInternetArray)
// -> [1, 2, 3, 4, 5, 1, 2, 3]
print(myInternetSet)
// -> [1, 4, 5, 2, 3]

var mySet1 : Set = [3,4,2]
var mySet2 : Set = [2,5,6]
var mySet3 = mySet1.union(mySet2)
print(mySet3)
// -> [5, 3, 6, 2, 4] **Birleştirme yaptık ve tekrar olanlı yazdırmadı**




//-------Dictionary------
var myFavoriDictionary = ["Pulp Fiction" : "Tarantino" , "Lock, Stock" : "Guy Ritchie"]
/*
 Burada anahtar key ilişkili dizi vardır.
 Çağırma işleminde anahtar değeriyle çağırıp değerini getiriyoruz
 */
myFavoriDictionary["Pulp Fiction"]   //-> "Tarantino"
myFavoriDictionary["Pulp Fiction"] = "Quentin Tarantino"
//Değerini değiştirmiş olduk

var myDictnry = ["Run" : 100, "Swin" : 200, "Basketboll" : 250]
myDictnry["Run"]   //-> 100

var myList = [["Atil" : 60 , "Hikmet" : 45],["Bar": 2, "Zeynep": 50]]
print(myList[1]["Bar"]!)
// 1. indexte Bar anahtarını çağır demek  //-> 2




//-------Döngüler------
//-While-
var number = 0
while number <= 10 {
    print(number)
    number += 1
}

var characterAlive = true
while characterAlive == true{
    print("Character Alive")
    characterAlive = false
}

//-For-
var myFruitArray = ["Banana","Apple","Orange"]
for fruit in myFruitArray {
    //myFruit dizisine git, Elemandaki her birini fruit içine at
    print(fruit)
}




//-------İf / Else / else if------
var myAge = 24
if myAge < 30{
    print("gençsin")
}else if myAge > 30 && myAge < 50{
    print("Orta yaşlısın")
}else{
    print("Yaşlısın")
}




//-------Fonksiyonlar-------
func myFunc(){
    print("my Func")
}
myFunc()  //-> my Func
/*
 Burada bir fonksiyon oluşturuduk. Fonksiyonlar tek başına çalışmaz.
 Fonksiyonları çağırmak gerekiyor. En büyük faydaları kod tekrarından kurtarır.
 */
func sumFunc(x: Int, y: Int){
    print(x + y)
}
sumFunc(x: 10, y: 20)

func sumFuncRet(x: Int, y: Int) -> Int {
    return x + y
}
let myFunctionVariable = sumFuncRet(x: 10, y: 20)
print(myFunctionVariable)

func logicFunc(a: Int, b: Int) -> Bool{
    if a > b {
        return true
    }else {
        return false
    }
}

logicFunc(a: 10, b: 20)




//-------Opsiyonlar-------
//var myName1 : String
    /////////////Diyelim bir tanım yaptık Kullanıcı ismini girecek ve Hepsini büyük yazacağız
//myName1.uppercased()
    /////////////Fakat bu şekilde hata vereceği için Opsiyonları bilmemiz gerekecek.
    /////// **Burayı komut satırı haline getireceğiz. Opsiyonlar ile bu durum nasıl çözümü şu  şekilde:

var myName1 : String?
myName1?.uppercased()
/* Bu şekilde kullanırsak veri gelede bilir gelmeyede bilir
   Gelirse kod çalışır, eğer veri yok ise çalışmaz. Anlık ' nil ' değerinde yani boşş
 */

var myName2 : String?
myName2!.uppercased()
/* Bu şekilde kullanırsak eğer abi yemin ederim değer gelecek demek.
   O anlamı taşıyor. Değer gelmez ise program büyük oranda patlıyor denilebilir. Rezil oldun.
 */

//Bazı yerlerde ? işaret sıkıntı çıktığından ! kullanırız ama bu büyük sorumluluk demek.
var myAge1 = "5"
if let myNumber1 = Int(myAge1) {
    print(myNumber1 * 5)
}else{
    print("wrong input")
}
/*
 Burada olay şu: Eğer Kullanıcı rakama dönüştürülebilecek bir değer girdiyse,
 bunu al inte dönüştür, myNumber1 içine at ve if kontrolünden inte geçebildiyse 5 ile çarp
 
 Olurda kullanıcı int e dönüşemeyecek bir değer girdiği vakit
 if let kodu sayesinde kontrolü yapılır ve wrong uyarısını verir
 */
