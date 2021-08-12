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

        if userDefaults.string(forKey: "first") != nil {
            return
        } else {
            for i in 1 ... 5 {
                VDdata = voltDownData(value: [i , "" , "" , "" , "" , "" , 0 , 0 , 0 , 0])
                try! realm.write {
                    realm.add(self.VDdata, update: .modified)
                }
            }
            userDefaults.set(1, forKey: "first")
        }
        setData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let voltDownCalc2VC = segue.destination as! VoltDownCalc2ViewController
        switch segue.identifier {
        case "number1":
            voltDownCalc2VC.VDdata = VDdataArray[0]
        case "number2":
            voltDownCalc2VC.VDdata = VDdataArray[1]
        case "number3":
            voltDownCalc2VC.VDdata = VDdataArray[2]
        case "number4":
            voltDownCalc2VC.VDdata = VDdataArray[3]
        default:
            voltDownCalc2VC.VDdata = VDdataArray[4]
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
        for i in 0...4 {
            total1 = total1 + VDdataArray[i].voltDown
            voltDownTotal.text = String(format:"%.2f",total1) + " (V)"
        }
        for i in 0...4 {
            total2 = total2 + VDdataArray[i].distance
            judgeDistance.text = String(format:"%.0f",total2) + " (m)"
        }
        if total2 <= 120 {
            judgeVoltDownRate.text = "5%以下"
            if VDdataArray[0].volt == "単相2線 100V" {
                judgeVoltDown.text = "5(V)"
            } else if VDdataArray[0].volt == "単相2線 200V" {
                judgeVoltDown.text = "10(V)"
            } else if VDdataArray[0].volt == "単相3線 100/200V" {
                judgeVoltDown.text = "10(V)"
            } else if VDdataArray[0].volt == "三相3線 200V" {
                judgeVoltDown.text = "10(V)"
            } else if VDdataArray[0].volt == "三相3線 400V" {
                judgeVoltDown.text = "20(V)"
            } else {
                judgeVoltDown.text = "未設定"
            }
        } else if total2 <= 200 {
            judgeVoltDownRate.text = "6%以下"
            if VDdataArray[0].volt == "単相2線 100V" {
                judgeVoltDown.text = "6(V)"
            } else if VDdataArray[0].volt == "単相2線 200V" {
                judgeVoltDown.text = "12(V)"
            } else if VDdataArray[0].volt == "単相3線 100/200V" {
                judgeVoltDown.text = "12(V)"
            } else if VDdataArray[0].volt == "三相3線 200V" {
                judgeVoltDown.text = "12(V)"
            } else if VDdataArray[0].volt == "三相3線 400V" {
                judgeVoltDown.text = "24(V)"
            } else {
                judgeVoltDown.text = "未設定"
            }
        } else {
            judgeVoltDownRate.text = "7%以下"
            if VDdataArray[0].volt == "単相2線 100V" {
                judgeVoltDown.text = "7(V)"
            } else if VDdataArray[0].volt == "単相2線 200V" {
                judgeVoltDown.text = "14(V)"
            } else if VDdataArray[0].volt == "単相3線 100/200V" {
                judgeVoltDown.text = "14(V)"
            } else if VDdataArray[0].volt == "三相3線 200V" {
                judgeVoltDown.text = "14(V)"
            } else if VDdataArray[0].volt == "三相3線 400V" {
                judgeVoltDown.text = "28(V)"
            } else {
                judgeVoltDown.text = "未設定"
            }
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        for i in 1 ... 5 {
            VDdata = voltDownData(value: [i , "" , "" , "" , "" , "" , 0 , 0 , 0 , 0])
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


//let result1 = realm.objects(voltDownData.self).filter("id == 1")
//let voltDownCalc2VC = segue.source as? VoltDownCalc2ViewController
//voltDown1.text = String((voltDownCalc2VC?.voltDownArray[0])!)
//voltDown2.text = String((voltDownCalc2VC?.voltDownArray[1])!)
//voltDown3.text = String((voltDownCalc2VC?.voltDownArray[2])!)
//voltDown4.text = String((voltDownCalc2VC?.voltDownArray[3])!)
//voltDown5.text = String((voltDownCalc2VC?.voltDownArray[4])!)
//voltDownRate1.text = String((voltDownCalc2VC?.voltDownRateArray[0])!)//
//voltDownRate3.text = String((voltDownCalc2VC?.voltDownRateArray[2])!)
//voltDownRate4.text = String((voltDownCalc2VC?.voltDownRateArray[3])!)
//voltDownRate5.text = String((voltDownCalc2VC?.voltDownRateArray[4])!)

