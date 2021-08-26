//
//  VoltDownCalc1ViewController.swift
//  Betelgeuse
//
//  Created by 由上博之 on 2021/07/22.
//

import UIKit
import RealmSwift

class VoltDownCalc1ViewController: UIViewController {
    
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    
    @IBOutlet weak var voltDown1: UILabel!
    @IBOutlet weak var voltDown2: UILabel!
    @IBOutlet weak var voltDown3: UILabel!
    @IBOutlet weak var voltDown4: UILabel!
    @IBOutlet weak var voltDown5: UILabel!
    
    @IBOutlet weak var voltDownRate1: UILabel!
    @IBOutlet weak var voltDownRate2: UILabel!
    @IBOutlet weak var voltDownRate3: UILabel!
    @IBOutlet weak var voltDownRate4: UILabel!
    @IBOutlet weak var voltDownRate5: UILabel!
    
    @IBOutlet weak var voltDownTotal: UILabel!
    @IBOutlet weak var voltDownRateTotal: UILabel!
    
    @IBOutlet weak var judgeDistance: UILabel!
    @IBOutlet weak var judgeVoltDown: UILabel!
    @IBOutlet weak var judgeVoltDownRate: UILabel!
    
    let realm = try! Realm()
    var VDdataArray = try! Realm().objects(voltDownData.self)
    var VDdata = voltDownData()
    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 0.5, green: 1, blue: 0.5, alpha: 1.0)
        if userDefaults.string(forKey: "first") != nil {
            return
        } else {
            for i in 1 ... 5 {
                VDdata = voltDownData(value: [i , "" , "" , "" , "" , "" , 0, 0 , 0 , 0 , 0])
                try! realm.write {
                    realm.add(self.VDdata, update: .modified)
                }
            }
            userDefaults.set(1, forKey: "first")
        }
        setData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "number1" || segue.identifier == "number2" || segue.identifier == "number3" || segue.identifier == "number4" || segue.identifier == "number5" {
            let voltDownCalc2VC = segue.destination as! VoltDownCalc2ViewController
            switch segue.identifier {
            case "number1":
                voltDownCalc2VC.VDdata = VDdataArray[0]
            case "number2":
                try! realm.write {
                    VDdataArray[1].volt = VDdataArray[0].volt
                    realm.add(VDdataArray, update: .modified)
                }
                voltDownCalc2VC.VDdata = VDdataArray[1]
            case "number3":
                try! realm.write {
                    VDdataArray[2].volt = VDdataArray[0].volt
                    realm.add(VDdataArray, update: .modified)
                }
                voltDownCalc2VC.VDdata = VDdataArray[2]
            case "number4":
                try! realm.write {
                    VDdataArray[3].volt = VDdataArray[0].volt
                    realm.add(VDdataArray, update: .modified)
                }
                voltDownCalc2VC.VDdata = VDdataArray[3]
            default:
                try! realm.write {
                    VDdataArray[4].volt = VDdataArray[0].volt
                    realm.add(VDdataArray, update: .modified)
                }
                voltDownCalc2VC.VDdata = VDdataArray[4]
            }
        }
    }
    
    func setData() {
        self.VDdataArray = try! Realm().objects(voltDownData.self)
        voltDown1.text = String(format:"%.2f",VDdataArray[0].voltDown) + " (V)"
        voltDown2.text = String(format:"%.2f",VDdataArray[1].voltDown) + " (V)"
        voltDown3.text = String(format:"%.2f",VDdataArray[2].voltDown) + " (V)"
        voltDown4.text = String(format:"%.2f",VDdataArray[3].voltDown) + " (V)"
        voltDown5.text = String(format:"%.2f",VDdataArray[4].voltDown) + " (V)"
        voltDownRate1.text = String(format:"%.2f",VDdataArray[0].voltDownRate) + " (%)"
        voltDownRate2.text = String(format:"%.2f",VDdataArray[1].voltDownRate) + " (%)"
        voltDownRate3.text = String(format:"%.2f",VDdataArray[2].voltDownRate) + " (%)"
        voltDownRate4.text = String(format:"%.2f",VDdataArray[3].voltDownRate) + " (%)"
        voltDownRate5.text = String(format:"%.2f",VDdataArray[4].voltDownRate) + " (%)"
        var total1: Float = 0
        var total2: Float = 0
        var total3: Float = 0
        
        for i in 0...4 {
            total1 = total1 + VDdataArray[i].voltDown
        }
        voltDownTotal.text = String(format:"%.2f",total1) + " (V)"
        
        for i in 0...4 {
            total2 = total2 + VDdataArray[i].voltDownRate
        }
        voltDownRateTotal.text = String(format: "%.2f", total2) + " (%)"
        
        for i in 0...4 {
            total3 = total3 + VDdataArray[i].distance
        }
        judgeDistance.text = String(format:"%.0f",total3) + " (m)"
        
        if total3 == 0 {
            judgeVoltDown.text = "未設定"
            judgeVoltDownRate.text = "未設定"
        } else if total3 <= 120 {
            judgeVoltDownRate.text = "5%以下"
            if VDdataArray[0].volt == "単相2線 105V" {
                judgeVoltDown.text = "5.25(V)"
            } else if VDdataArray[0].volt == "単相2線 210V" {
                judgeVoltDown.text = "10.5(V)"
            } else if VDdataArray[0].volt == "単相3線 105/210V" {
                judgeVoltDown.text = "5.25(V)"
            } else if VDdataArray[0].volt == "三相3線 210V" {
                judgeVoltDown.text = "10.5(V)"
            } else if VDdataArray[0].volt == "三相3線 420V" {
                judgeVoltDown.text = "21(V)"
            } else {
                judgeVoltDown.text = "未設定"
            }
        } else if total3 <= 200 {
            judgeVoltDownRate.text = "6%以下"
            if VDdataArray[0].volt == "単相2線 105V" {
                judgeVoltDown.text = "6.3(V)"
            } else if VDdataArray[0].volt == "単相2線 210V" {
                judgeVoltDown.text = "12.6(V)"
            } else if VDdataArray[0].volt == "単相3線 105/210V" {
                judgeVoltDown.text = "6.3(V)"
            } else if VDdataArray[0].volt == "三相3線 210V" {
                judgeVoltDown.text = "12.6(V)"
            } else if VDdataArray[0].volt == "三相3線 420V" {
                judgeVoltDown.text = "25.2(V)"
            } else {
                judgeVoltDown.text = "未設定"
            }
        } else if total3 > 200 {
            judgeVoltDownRate.text = "7%以下"
            if VDdataArray[0].volt == "単相2線 105V" {
                judgeVoltDown.text = "7.35(V)"
            } else if VDdataArray[0].volt == "単相2線 210V" {
                judgeVoltDown.text = "14.7(V)"
            } else if VDdataArray[0].volt == "単相3線 105/210V" {
                judgeVoltDown.text = "7.35(V)"
            } else if VDdataArray[0].volt == "三相3線 210V" {
                judgeVoltDown.text = "14.7(V)"
            } else if VDdataArray[0].volt == "三相3線 420V" {
                judgeVoltDown.text = "29.4(V)"
            } else {
                judgeVoltDown.text = "未設定"
            }
        } else {
            judgeVoltDown.text = "範囲外"
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        for i in 1 ... 5 {
            VDdata = voltDownData(value: [i , "" , "" , "" , "" , "" , 0 , 0 , 0 , 0 , 0])
            try! realm.write {
                realm.add(self.VDdata, update: .modified)
            }
        }
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
    }
    
    @IBAction func unwind3(_ segue:UIStoryboardSegue) {
    }
}
