//
//  VoltDownCalc2ViewController.swift
//  Betelgeuse
//
//  Created by 由上博之 on 2021/07/22.
//

import UIKit
import RealmSwift

class VoltDownCalc2ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var volt: UITextField!
    @IBOutlet weak var cable: UITextField!
    @IBOutlet weak var cablesize: UITextField!
    @IBOutlet weak var frequency: UITextField!
    @IBOutlet weak var factor: UITextField!
    @IBOutlet weak var impedance: UILabel!
    @IBOutlet weak var current: UITextField!
    @IBOutlet weak var distance: UITextField!
    @IBOutlet weak var voltDown: UILabel!
    @IBOutlet weak var voltDownRate: UILabel!
    
    var pickerView: UIPickerView = UIPickerView()
    var pickerView2: UIPickerView = UIPickerView()
    var pickerView3: UIPickerView = UIPickerView()
    var pickerView4: UIPickerView = UIPickerView()
    var pickerView5: UIPickerView = UIPickerView()
    
    let list1 = ["単相2線 105V","単相2線 210V","単相3線 105/210V","三相3線 210V","三相3線 420V"]
    let list2 = ["CV1c","CV2c/3c","CV4c","CVD/CVT","CVQ"]
    let list31 = ["2sq","3.5sq","5.5sq","8sq","14sq","22sq","38sq","60sq","100sq","150sq","200sq","250sq","325sq"]
    let list32 = ["14sq","22sq","38sq","60sq","100sq","150sq","200sq","250sq","325sq"]
    let list4 = ["50Hz" , "60Hz"]
    let list5 = ["1", "0.9" , "0.8"]
    var k: Float = 0
    var v: Int = 0
    var z: Float = 0
    
    let realm = try! Realm()
    var VDdata: voltDownData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 0.5, green: 1, blue: 0.5, alpha: 1.0)
        number.text = String(VDdata.id)
        volt.text = VDdata.volt
        cable.text = VDdata.cable
        cablesize.text = VDdata.cablesize
        frequency.text = VDdata.frequency
        factor.text = VDdata.factor
        impedance.text = String(VDdata.impedance) + " (Ω/km)"
        if VDdata.current == 0 {
            current.text = ""
        } else {
            current.text = String(VDdata.current)
        }
        if VDdata.distance == 0 {
            distance.text = ""
        } else {
            distance.text = String(VDdata.distance)
        }
        voltDown.text = String(format:"%.2f",VDdata.voltDown) + " (V)"
        voltDownRate.text = String(format:"%.2f",VDdata.voltDownRate) + " (%)"
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = 1
        
        pickerView2.delegate = self
        pickerView2.dataSource = self
        pickerView2.tag = 2
        
        pickerView3.delegate = self
        pickerView3.dataSource = self
        
        pickerView4.delegate = self
        pickerView4.dataSource = self
        pickerView4.tag = 4
        
        pickerView5.delegate = self
        pickerView5.dataSource = self
        pickerView5.tag = 5
        
        current.delegate = self
        distance.delegate = self
        
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let toolbar2 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let toolbar3 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let toolbar4 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let toolbar5 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(VoltDownCalc2ViewController.done))
        let doneItem2 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(VoltDownCalc2ViewController.done2))
        let doneItem3 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(VoltDownCalc2ViewController.done3))
        let doneItem4 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(VoltDownCalc2ViewController.done4))
        let doneItem5 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(VoltDownCalc2ViewController.done5))
        
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(VoltDownCalc2ViewController.cancel))
        let cancelItem2 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(VoltDownCalc2ViewController.cancel2))
        let cancelItem3 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(VoltDownCalc2ViewController.cancel3))
        let cancelItem4 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(VoltDownCalc2ViewController.cancel4))
        let cancelItem5 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(VoltDownCalc2ViewController.cancel5))
        
        toolbar.setItems([cancelItem, doneItem], animated: true)
        toolbar2.setItems([cancelItem2, doneItem2], animated: true)
        toolbar3.setItems([cancelItem3, doneItem3], animated: true)
        toolbar4.setItems([cancelItem4, doneItem4], animated: true)
        toolbar5.setItems([cancelItem5, doneItem5], animated: true)
        
        if VDdata.id == 1 {
            self.volt.inputView = pickerView
            self.volt.inputAccessoryView = toolbar
        } else {
            volt.isEnabled = false
        }
        
        self.cable.inputView = pickerView2
        self.cable.inputAccessoryView = toolbar2
        
        self.cablesize.inputView = pickerView3
        self.cablesize.inputAccessoryView = toolbar3
        
        self.frequency.inputView = pickerView4
        self.frequency.inputAccessoryView = toolbar4
        
        self.factor.inputView = pickerView5
        self.factor.inputAccessoryView = toolbar5
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        current.resignFirstResponder()
        distance.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            cable.isEnabled = false
            cablesize.isEnabled = false
            frequency.isEnabled = false
            factor.isEnabled = false
            current.isEnabled = false
            distance.isEnabled = false
            return list1.count
        } else if pickerView.tag == 2 {
            volt.isEnabled = false
            cablesize.isEnabled = false
            frequency.isEnabled = false
            factor.isEnabled = false
            current.isEnabled = false
            distance.isEnabled = false
            return list2.count
        } else if pickerView.tag == 31 {
            volt.isEnabled = false
            cable.isEnabled = false
            frequency.isEnabled = false
            factor.isEnabled = false
            current.isEnabled = false
            distance.isEnabled = false
            return list31.count
        } else if pickerView.tag == 32 {
            volt.isEnabled = false
            cable.isEnabled = false
            frequency.isEnabled = false
            factor.isEnabled = false
            current.isEnabled = false
            distance.isEnabled = false
            return list32.count
        } else if pickerView.tag == 4 {
            volt.isEnabled = false
            cable.isEnabled = false
            cablesize.isEnabled = false
            factor.isEnabled = false
            current.isEnabled = false
            distance.isEnabled = false
            return list4.count
        } else if pickerView.tag == 5 {
            volt.isEnabled = false
            cable.isEnabled = false
            cablesize.isEnabled = false
            frequency.isEnabled = false
            current.isEnabled = false
            distance.isEnabled = false
            return list5.count
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return list1[row]
        } else if pickerView.tag == 2 {
            return list2[row]
        } else if pickerView.tag == 31 {
            return list31[row]
        } else if pickerView.tag == 32 {
            return list32[row]
        } else if pickerView.tag == 4 {
            return list4[row]
        } else if pickerView.tag == 5 {
            return list5[row]
        } else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            self.volt.text = list1[row]
        } else if pickerView.tag == 2 {
            self.cable.text = list2[row]
        } else if pickerView.tag == 31 {
            self.cablesize.text = list31[row]
        } else if pickerView.tag == 32 {
            self.cablesize.text = list32[row]
        } else if pickerView.tag == 4 {
            self.frequency.text = list4[row]
        } else if pickerView.tag == 5 {
            self.factor.text = list5[row]
        } else {
            return
        }
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    @objc func cancel() {
        cable.isEnabled = true
        cablesize.isEnabled = true
        frequency.isEnabled = true
        factor.isEnabled = true
        current.isEnabled = true
        distance.isEnabled = true
            self.volt.text = ""
            self.volt.endEditing(true)
    }
    
    @objc func cancel2() {
        volt.isEnabled = true
        cablesize.isEnabled = true
        frequency.isEnabled = true
        factor.isEnabled = true
        current.isEnabled = true
        distance.isEnabled = true
            self.cable.text = ""
            self.cable.endEditing(true)
    }
    
    @objc func cancel3() {
        volt.isEnabled = true
        cable.isEnabled = true
        frequency.isEnabled = true
        factor.isEnabled = true
        current.isEnabled = true
        distance.isEnabled = true
            self.cablesize.text = ""
            self.cablesize.endEditing(true)
    }
    
    @objc func cancel4() {
        volt.isEnabled = true
        cable.isEnabled = true
        cablesize.isEnabled = true
        factor.isEnabled = true
        current.isEnabled = true
        distance.isEnabled = true
            self.frequency.text = ""
            self.frequency.endEditing(true)
    }
    
    @objc func cancel5() {
        volt.isEnabled = true
        cable.isEnabled = true
        cablesize.isEnabled = true
        frequency.isEnabled = true
        current.isEnabled = true
        distance.isEnabled = true
            self.factor.text = ""
            self.factor.endEditing(true)
    }
    
    @objc func done() {
        cable.isEnabled = true
        cablesize.isEnabled = true
        frequency.isEnabled = true
        factor.isEnabled = true
        current.isEnabled = true
        distance.isEnabled = true
            self.volt.endEditing(true)
    }
    
    @objc func done2() {
        volt.isEnabled = true
        cablesize.isEnabled = true
        frequency.isEnabled = true
        factor.isEnabled = true
        current.isEnabled = true
        distance.isEnabled = true
        if cable.text == "CV1c" || cable.text == "CV2c/3c" || cable.text == "CV4c" {
            pickerView3.tag = 31
        } else if cable.text == "CVD/CVT" || cable.text == "CVQ" {
            pickerView3.tag = 32
        } else {
            return
        }
            self.cable.endEditing(true)
    }
    
    @objc func done3() {
        volt.isEnabled = true
        cable.isEnabled = true
        frequency.isEnabled = true
        factor.isEnabled = true
        current.isEnabled = true
        distance.isEnabled = true
            self.cablesize.endEditing(true)
    }
    
    @objc func done4() {
        volt.isEnabled = true
        cable.isEnabled = true
        cablesize.isEnabled = true
        factor.isEnabled = true
        current.isEnabled = true
        distance.isEnabled = true
            self.frequency.endEditing(true)
    }
    
    @objc func done5() {
        volt.isEnabled = true
        cable.isEnabled = true
        cablesize.isEnabled = true
        frequency.isEnabled = true
        current.isEnabled = true
        distance.isEnabled = true
            self.factor.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            VDdata.volt = volt.text!
            VDdata.cable = cable.text!
            VDdata.cablesize = cablesize.text!
            VDdata.frequency = frequency.text!
            VDdata.factor = factor.text!
            realm.add(VDdata, update: .modified)
        }
    }
    
    @IBAction func voltDownCalc(_ sender: Any) {
        if volt.text == "単相2線 105V" {
            k = 2
            v = 105
        } else if volt.text == "単相2線 210V" {
            k = 2
            v = 210
        } else if volt.text == "単相3線 105/210V" {
            k = 1
            v = 105
        } else if volt.text == "三相3線 210V" {
            k = abs(3)
            v = 210
        } else {
            k = abs(3)
            v = 420
        }
        
        if cable.text == "CV1c" {                              // cv1c
            if cablesize.text == "2sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 11.8
                    } else if factor.text == "0.9" {
                        z = 10.7
                    } else {
                        z = 9.52
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 11.8
                    } else if factor.text == "0.9" {
                        z = 10.7
                    } else {
                        z = 9.54
                    }
                }
            } else if cablesize.text == "3.5sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 6.63
                    } else if factor.text == "0.9" {
                        z = 6.02
                    } else {
                        z = 5.38
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 6.63
                    } else if factor.text == "0.9" {
                        z = 6.03
                    } else {
                        z = 5.40
                    }
                }
            } else if cablesize.text == "5.5sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 4.25
                    } else if factor.text == "0.9" {
                        z = 3.88
                    } else {
                        z = 3.47
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 4.25
                    } else if factor.text == "0.9" {
                        z = 3.89
                    } else {
                        z = 3.49
                    }
                }
            } else if cablesize.text == "8sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 2.95
                    } else if factor.text == "0.9" {
                        z = 2.70
                    } else {
                        z = 2.43
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 2.95
                    } else if factor.text == "0.9" {
                        z = 2.71
                    } else {
                        z = 2.44
                    }
                }
            } else if cablesize.text == "14sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 1.67
                    } else if factor.text == "0.9" {
                        z = 1.55
                    } else {
                        z = 1.40
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 1.67
                    } else if factor.text == "0.9" {
                        z = 1.56
                    } else {
                        z = 1.41
                    }
                }
            } else if cablesize.text == "22sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 1.06
                    } else if factor.text == "0.9" {
                        z = 1.00
                    } else {
                        z = 0.910
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 1.06
                    } else if factor.text == "0.9" {
                        z = 1.01
                    } else {
                        z = 0.922
                    }
                }
            } else if cablesize.text == "38sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.614
                    } else if factor.text == "0.9" {
                        z = 0.594
                    } else {
                        z = 0.549
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.614
                    } else if factor.text == "0.9" {
                        z = 0.603
                    } else {
                        z = 0.560
                    }
                }
            } else if cablesize.text == "60sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.389
                    } else if factor.text == "0.9" {
                        z = 0.390
                    } else {
                        z = 0.366
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.390
                    } else if factor.text == "0.9" {
                        z = 0.399
                    } else {
                        z = 0.378
                    }
                }
            } else if cablesize.text == "100sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.234
                    } else if factor.text == "0.9" {
                        z = 0.249
                    } else {
                        z = 0.240
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.234
                    } else if factor.text == "0.9" {
                        z = 0.257
                    } else {
                        z = 0.251
                    }
                }
            } else if cablesize.text == "150sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.157
                    } else if factor.text == "0.9" {
                        z = 0.178
                    } else {
                        z = 0.176
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.157
                    } else if factor.text == "0.9" {
                        z = 0.186
                    } else {
                        z = 0.187
                    }
                }
            } else if cablesize.text == "200sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.118
                    } else if factor.text == "0.9" {
                        z = 0.144
                    } else {
                        z = 0.146
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.119
                    } else if factor.text == "0.9" {
                        z = 0.152
                    } else {
                        z = 0.157
                    }
                }
            } else if cablesize.text == "250sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.0962
                    } else if factor.text == "0.9" {
                        z = 0.123
                    } else {
                        z = 0.127
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.0971
                    } else if factor.text == "0.9" {
                        z = 0.131
                    } else {
                        z = 0.138
                    }
                }
            } else if cablesize.text == "325sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.0751
                    } else if factor.text == "0.9" {
                        z = 0.103
                    } else {
                        z = 0.109
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.0762
                    } else if factor.text == "0.9" {
                        z = 0.111
                    } else {
                        z = 0.120
                    }
                }
            }
            
        } else if cable.text == "CV2c/3c" {                              // cv2c3c
            if cablesize.text == "2sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 12.0
                    } else if factor.text == "0.9" {
                        z = 10.8
                    } else {
                        z = 9.66
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 12.0
                    } else if factor.text == "0.9" {
                        z = 10.9
                    } else {
                        z = 9.67
                    }
                }
            } else if cablesize.text == "3.5sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 6.76
                    } else if factor.text == "0.9" {
                        z = 6.12
                    } else {
                        z = 5.46
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 6.76
                    } else if factor.text == "0.9" {
                        z = 6.13
                    } else {
                        z = 5.47
                    }
                }
            } else if cablesize.text == "5.5sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 4.34
                    } else if factor.text == "0.9" {
                        z = 3.95
                    } else {
                        z = 3.53
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 4.34
                    } else if factor.text == "0.9" {
                        z = 3.95
                    } else {
                        z = 3.54
                    }
                }
            } else if cablesize.text == "8sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 3.01
                    } else if factor.text == "0.9" {
                        z = 2.75
                    } else {
                        z = 2.46
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 3.01
                    } else if factor.text == "0.9" {
                        z = 2.75
                    } else {
                        z = 2.47
                    }
                }
            } else if cablesize.text == "14sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 1.71
                    } else if factor.text == "0.9" {
                        z = 1.58
                    } else {
                        z = 1.42
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 1.71
                    } else if factor.text == "0.9" {
                        z = 1.58
                    } else {
                        z = 1.43
                    }
                }
            } else if cablesize.text == "22sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 1.08
                    } else if factor.text == "0.9" {
                        z = 1.01
                    } else {
                        z = 0.913
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 1.08
                    } else if factor.text == "0.9" {
                        z = 1.01
                    } else {
                        z = 0.923
                    }
                }
            } else if cablesize.text == "38sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.626
                    } else if factor.text == "0.9" {
                        z = 0.597
                    } else {
                        z = 0.547
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.627
                    } else if factor.text == "0.9" {
                        z = 0.605
                    } else {
                        z = 0.557
                    }
                }
            } else if cablesize.text == "60sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.397
                    } else if factor.text == "0.9" {
                        z = 0.391
                    } else {
                        z = 0.364
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.397
                    } else if factor.text == "0.9" {
                        z = 0.397
                    } else {
                        z = 0.373
                    }
                }
            } else if cablesize.text == "100sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.239
                    } else if factor.text == "0.9" {
                        z = 0.249
                    } else {
                        z = 0.238
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.240
                    } else if factor.text == "0.9" {
                        z = 0.256
                    } else {
                        z = 0.248
                    }
                }
            } else if cablesize.text == "150sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.160
                    } else if factor.text == "0.9" {
                        z = 0.176
                    } else {
                        z = 0.173
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.160
                    } else if factor.text == "0.9" {
                        z = 0.183
                    } else {
                        z = 0.182
                    }
                }
            } else if cablesize.text == "200sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.121
                    } else if factor.text == "0.9" {
                        z = 0.142
                    } else {
                        z = 0.142
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.122
                    } else if factor.text == "0.9" {
                        z = 0.149
                    } else {
                        z = 0.152
                    }
                }
            } else if cablesize.text == "250sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.0985
                    } else if factor.text == "0.9" {
                        z = 0.121
                    } else {
                        z = 0.123
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.0995
                    } else if factor.text == "0.9" {
                        z = 0.128
                    } else {
                        z = 0.133
                    }
                }
            } else if cablesize.text == "325sq" {
                if frequency.text == "50Hz" {
                    if factor.text == "1" {
                        z = 0.0770
                    } else if factor.text == "0.9" {
                        z = 0.101
                    } else {
                        z = 0.105
                    }
                } else if frequency.text == "60Hz" {
                    if factor.text == "1" {
                        z = 0.0783
                    } else if factor.text == "0.9" {
                        z = 0.108
                    } else {
                        z = 0.115
                    }
                }
            }
            
        } else if cable.text == "CV4c" {                              // cv4c
                if cablesize.text == "2sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 12.0
                        } else if factor.text == "0.9" {
                            z = 10.8
                        } else {
                            z = 9.66
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 12.0
                        } else if factor.text == "0.9" {
                            z = 10.9
                        } else {
                            z = 9.68
                        }
                    }
                } else if cablesize.text == "3.5sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 6.76
                        } else if factor.text == "0.9" {
                            z = 6.13
                        } else {
                            z = 5.47
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 6.76
                        } else if factor.text == "0.9" {
                            z = 6.14
                        } else {
                            z = 5.48
                        }
                    }
                } else if cablesize.text == "5.5sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 4.34
                        } else if factor.text == "0.9" {
                            z = 3.95
                        } else {
                            z = 3.53
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 4.34
                        } else if factor.text == "0.9" {
                            z = 3.96
                        } else {
                            z = 3.54
                        }
                    }
                } else if cablesize.text == "8sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 3.01
                        } else if factor.text == "0.9" {
                            z = 2.75
                        } else {
                            z = 2.46
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 3.01
                        } else if factor.text == "0.9" {
                            z = 2.76
                        } else {
                            z = 2.48
                        }
                    }
                } else if cablesize.text == "14sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 1.71
                        } else if factor.text == "0.9" {
                            z = 1.58
                        } else {
                            z = 1.42
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 1.71
                        } else if factor.text == "0.9" {
                            z = 1.59
                        } else {
                            z = 1.43
                        }
                    }
                } else if cablesize.text == "22sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 1.08
                        } else if factor.text == "0.9" {
                            z = 1.01
                        } else {
                            z = 0.918
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 1.08
                        } else if factor.text == "0.9" {
                            z = 1.02
                        } else {
                            z = 0.928
                        }
                    }
                } else if cablesize.text == "38sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.626
                        } else if factor.text == "0.9" {
                            z = 0.600
                        } else {
                            z = 0.551
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.627
                        } else if factor.text == "0.9" {
                            z = 0.608
                        } else {
                            z = 0.562
                        }
                    }
                } else if cablesize.text == "60sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.397
                        } else if factor.text == "0.9" {
                            z = 0.394
                        } else {
                            z = 0.368
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.397
                        } else if factor.text == "0.9" {
                            z = 0.401
                        } else {
                            z = 0.378
                        }
                    }
                } else if cablesize.text == "100sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.239
                        } else if factor.text == "0.9" {
                            z = 0.252
                        } else {
                            z = 0.242
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.240
                        } else if factor.text == "0.9" {
                            z = 0.260
                        } else {
                            z = 0.253
                        }
                    }
                } else if cablesize.text == "150sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.160
                        } else if factor.text == "0.9" {
                            z = 0.180
                        } else {
                            z = 0.177
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.160
                        } else if factor.text == "0.9" {
                            z = 0.187
                        } else {
                            z = 0.187
                        }
                    }
                } else if cablesize.text == "200sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.121
                        } else if factor.text == "0.9" {
                            z = 0.145
                        } else {
                            z = 0.146
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.122
                        } else if factor.text == "0.9" {
                            z = 0.153
                        } else {
                            z = 0.157
                        }
                    }
                } else if cablesize.text == "250sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.0985
                        } else if factor.text == "0.9" {
                            z = 0.124
                        } else {
                            z = 0.128
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.0995
                        } else if factor.text == "0.9" {
                            z = 0.132
                        } else {
                            z = 0.138
                        }
                    }
                } else if cablesize.text == "325sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.0770
                        } else if factor.text == "0.9" {
                            z = 0.104
                        } else {
                            z = 0.109
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.0783
                        } else if factor.text == "0.9" {
                            z = 0.112
                        } else {
                            z = 0.120
                        }
                    }
                }
                
            } else if cable.text == "CVD/CVT" {                              // cvd cvt
                if cablesize.text == "14sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 1.71
                        } else if factor.text == "0.9" {
                            z = 1.59
                        } else {
                            z = 1.43
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 1.71
                        } else if factor.text == "0.9" {
                            z = 1.59
                        } else {
                            z = 1.44
                        }
                    }
                } else if cablesize.text == "22sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 1.08
                        } else if factor.text == "0.9" {
                            z = 1.02
                        } else {
                            z = 0.926
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 1.08
                        } else if factor.text == "0.9" {
                            z = 1.03
                        } else {
                            z = 0.938
                        }
                    }
                } else if cablesize.text == "38sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.626
                        } else if factor.text == "0.9" {
                            z = 0.605
                        } else {
                            z = 0.558
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.626
                        } else if factor.text == "0.9" {
                            z = 0.614
                        } else {
                            z = 0.570
                        }
                    }
                } else if cablesize.text == "60sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.397
                        } else if factor.text == "0.9" {
                            z = 0.397
                        } else {
                            z = 0.372
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.397
                        } else if factor.text == "0.9" {
                            z = 0.405
                        } else {
                            z = 0.384
                        }
                    }
                } else if cablesize.text == "100sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.239
                        } else if factor.text == "0.9" {
                            z = 0.254
                        } else {
                            z = 0.244
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.240
                        } else if factor.text == "0.9" {
                            z = 0.262
                        } else {
                            z = 0.256
                        }
                    }
                } else if cablesize.text == "150sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.159
                        } else if factor.text == "0.9" {
                            z = 0.180
                        } else {
                            z = 0.178
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.160
                        } else if factor.text == "0.9" {
                            z = 0.188
                        } else {
                            z = 0.189
                        }
                    }
                } else if cablesize.text == "200sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.121
                        } else if factor.text == "0.9" {
                            z = 0.146
                        } else {
                            z = 0.148
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.121
                        } else if factor.text == "0.9" {
                            z = 0.154
                        } else {
                            z = 0.159
                        }
                    }
                } else if cablesize.text == "250sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.0981
                        } else if factor.text == "0.9" {
                            z = 0.125
                        } else {
                            z = 0.129
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.0989
                        } else if factor.text == "0.9" {
                            z = 0.133
                        } else {
                            z = 0.139
                        }
                    }
                } else if cablesize.text == "325sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.0764
                        } else if factor.text == "0.9" {
                            z = 0.104
                        } else {
                            z = 0.110
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.0775
                        } else if factor.text == "0.9" {
                            z = 0.112
                        } else {
                            z = 0.121
                        }
                    }
                }
                
            } else if cable.text == "CVQ" {                              // cvq
                if cablesize.text == "14sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 1.71
                        } else if factor.text == "0.9" {
                            z = 1.59
                        } else {
                            z = 1.44
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 1.71
                        } else if factor.text == "0.9" {
                            z = 1.60
                        } else {
                            z = 1.45
                        }
                    }
                } else if cablesize.text == "22sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 1.08
                        } else if factor.text == "0.9" {
                            z = 1.02
                        } else {
                            z = 0.930
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 1.08
                        } else if factor.text == "0.9" {
                            z = 1.03
                        } else {
                            z = 0.943
                        }
                    }
                } else if cablesize.text == "38sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.626
                        } else if factor.text == "0.9" {
                            z = 0.608
                        } else {
                            z = 0.563
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.626
                        } else if factor.text == "0.9" {
                            z = 0.617
                        } else {
                            z = 0.575
                        }
                    }
                } else if cablesize.text == "60sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.397
                        } else if factor.text == "0.9" {
                            z = 0.400
                        } else {
                            z = 0.377
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.397
                        } else if factor.text == "0.9" {
                            z = 0.409
                        } else {
                            z = 0.389
                        }
                    }
                } else if cablesize.text == "100sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.239
                        } else if factor.text == "0.9" {
                            z = 0.257
                        } else {
                            z = 0.249
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.240
                        } else if factor.text == "0.9" {
                            z = 0.266
                        } else {
                            z = 0.261
                        }
                    }
                } else if cablesize.text == "150sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.159
                        } else if factor.text == "0.9" {
                            z = 0.183
                        } else {
                            z = 0.182
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.160
                        } else if factor.text == "0.9" {
                            z = 0.192
                        } else {
                            z = 0.195
                        }
                    }
                } else if cablesize.text == "200sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.121
                        } else if factor.text == "0.9" {
                            z = 0.150
                        } else {
                            z = 0.153
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.121
                        } else if factor.text == "0.9" {
                            z = 0.158
                        } else {
                            z = 0.164
                        }
                    }
                } else if cablesize.text == "250sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.0981
                        } else if factor.text == "0.9" {
                            z = 0.128
                        } else {
                            z = 0.133
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.0989
                        } else if factor.text == "0.9" {
                            z = 0.137
                        } else {
                            z = 0.145
                        }
                    }
                } else if cablesize.text == "325sq" {
                    if frequency.text == "50Hz" {
                        if factor.text == "1" {
                            z = 0.0764
                        } else if factor.text == "0.9" {
                            z = 0.108
                        } else {
                            z = 0.115
                        }
                    } else if frequency.text == "60Hz" {
                        if factor.text == "1" {
                            z = 0.0775
                        } else if factor.text == "0.9" {
                            z = 0.116
                        } else {
                            z = 0.126
                        }
                    }
                }
            }
        
        try! realm.write {
            //let nsstring3: NSString = NSString(string: current.text!)
            VDdata.current = NSString(string: current.text!).floatValue
            //let nsstring4: NSString = NSString(string: distance.text!)
            VDdata.distance = NSString(string: distance.text!).floatValue
            VDdata.voltDown = k * VDdata.distance * VDdata.current * z / 1000
            VDdata.voltDownRate = VDdata.voltDown / Float(v) * 100
            VDdata.impedance = z
            realm.add(VDdata, update: .modified)
        }
        
        voltDown.text = String(format:"%.2f",VDdata.voltDown) + " (V)"
        voltDownRate.text = String(format:"%.2f",VDdata.voltDownRate) + " (%)"
        impedance.text = String(VDdata.impedance) + " (Ω/km)"
    }
    
    //let cv1c2:[[Double]] = [[11.8 , 10.7 , 9.52],[11.8 , 10.7 , 9.54]]
    //let cv1c35:[[Double]] = [[6.63 , 6.02 , 5.38],[6.63 , 6.03 , 5.40]]
    //let cv1c55:[[Double]] = [[4.25 , 3.88 , 3.47],[4.25 , 3.89 , 3.49]]
    //let cv1c8:[[Double]] = [[2.95 , 2.70 , 2.43],[2.95 , 2.71 , 2.44]]
    //let cv1c14:[[Double]] = [[1.67 , 1.55 , 1.40],[1.67 , 1.56 , 1.41]]
    //let cv1c22:[[Double]] = [[1.06 , 1.00 , 0.910],[1.06 , 1.01 , 0.922]]
    //let cv1c38:[[Double]] = [[0.614 , 0.594 , 0.549],[0.614 , 0.603 , 0.560]]
    //let cv1c60:[[Double]] = [[0.389 , 0.390 , 0.366],[0.390 , 0.399 , 0.378]]
    //let cv1c100:[[Double]] = [[0.234 , 0.249 , 0.240],[0.234 , 0.257 , 0.251]]
    //let cv1c150:[[Double]] = [[0.157 , 0.178 , 0.176],[0.157 , 0.186 , 0.187]]
    //let cv1c200:[[Double]] = [[0.118 , 0.144 , 0.146],[0.119 , 0.152 , 0.157]]
    //let cv1c250:[[Double]] = [[0.0962 , 0.123 , 0.127],[0.0971 , 0.131 , 0.138]]
    //let cv1c325:[[Double]] = [[0.0751 , 0.103 , 0.109],[0.0762 , 0.111 , 0.120]]
    
    //let cv2c2:[[Double]] = [[12.0 , 10.8 , 9.66],[12.0 , 10.9 , 9.67]]
    //let cv2c35:[[Double]] = [[6.76 , 6.12 , 5.46],[6.76 , 6.13 , 5.47]]
    //let cv2c55:[[Double]] = [[4.34 , 3.95 , 3.53],[4.34 , 3.95 , 3.54]]
    //let cv2c8:[[Double]] = [[3.01 , 2.75 , 2.46],[3.01 , 2.75 , 2.47]]
    //let cv2c14:[[Double]] = [[1.71 , 1.58 , 1.42],[1.71 , 1.58 , 1.43]]
    //let cv2c22:[[Double]] = [[1.08 , 1.01 , 0.913],[1.08 , 1.01 , 0.923]]
    //let cv2c38:[[Double]] = [[0.626 , 0.597 , 0.547],[0.627 , 0.605 , 0.557]]
    //let cv2c60:[[Double]] = [[0.397 , 0.391 , 0.364],[0.397 , 0.397 , 0.373]]
    //let cv2c100:[[Double]] = [[0.239 , 0.249 , 0.238],[0.240 , 0.256 , 0.248]]
    //let cv2c150:[[Double]] = [[0.160 , 0.176 , 0.173],[0.160 , 0.183 , 0.182]]
    //let cv2c200:[[Double]] = [[0.121 , 0.142 , 0.142],[0.122 , 0.149 , 0.152]]
    //let cv2c250:[[Double]] = [[0.0985 , 0.121 , 0.123],[0.0995 , 0.128 , 0.133]]
    //let cv2c325:[[Double]] = [[0.0770 , 0.101 , 0.105],[0.0783 , 0.108 , 0.115]]
    
    //let cv4c2:[[Double]] = [[12.0 , 10.8 , 9.66],[12.0 , 10.9 , 9.68]]
    //let cv4c35:[[Double]] = [[6.76 , 6.13 , 5.47],[6.76 , 6.14 , 5.48]]
    //let cv4c55:[[Double]] = [[4.34 , 3.95 , 3.53],[4.34 , 3.96 , 3.54]]
    //let cv4c8:[[Double]] = [[3.01 , 2.75 , 2.46],[3.01 , 2.76 , 2.48]]
    //let cv4c14:[[Double]] = [[1.71 , 1.58 , 1.42],[1.71 , 1.59 , 1.43]]
    //let cv4c22:[[Double]] = [[1.08 , 1.01 , 0.918],[1.08 , 1.02 , 0.928]]
    //let cv4c38:[[Double]] = [[0.626 , 0.600 , 0.551],[0.627 , 0.608 , 0.562]]
    //let cv4c60:[[Double]] = [[0.397 , 0.394 , 0.368],[0.397 , 0.401 , 0.378]]
    //let cv4c100:[[Double]] = [[0.239 , 0.252 , 0.242],[0.240 , 0.260 , 0.253]]
    //let cv4c150:[[Double]] = [[0.160 , 0.180 , 0.177],[0.160 , 0.187 , 0.187]]
    //let cv4c200:[[Double]] = [[0.121 , 0.145 , 0.146],[0.122 , 0.153 , 0.157]]
    //let cv4c250:[[Double]] = [[0.0985 , 0.124 , 0.128],[0.0995 , 0.132 , 0.138]]
    //let cv4c325:[[Double]] = [[0.0770 , 0.104 , 0.109],[0.0783 , 0.112 , 0.120]]
    
    //let cvt14:[[Double]] = [[1.71 , 1.59 , 1.43],[1.71 , 1.59 , 1.44]]
    //let cvt22:[[Double]] = [[1.08 , 1.02 , 0.926],[1.08 , 1.03 , 0.938]]
    //let cvt38:[[Double]] = [[0.626 , 0.605 , 0.558],[0.626 , 0.614 , 0.570]]
    //let cvt60:[[Double]] = [[0.397 , 0.397 , 0.372],[0.397 , 0.405 , 0.384]]
    //let cvt100:[[Double]] = [[0.239 , 0.254 , 0.244],[0.240 , 0.262 , 0.256]]
    //let cvt150:[[Double]] = [[0.159 , 0.180 , 0.178],[0.160 , 0.188 , 0.189]]
    //let cvt200:[[Double]] = [[0.121 , 0.146 , 0.148],[0.121 , 0.154 , 0.159]]
    //let cvt250:[[Double]] = [[0.0981 , 0.125 , 0.129],[0.0989 , 0.133 , 0.139]]
    //let cvt325:[[Double]] = [[0.0764 , 0.104 , 0.110],[0.0775 , 0.112 , 0.121]]
    
    //let cvd14:[[Double]] = [[1.71 , 1.59 , 1.44],[1.71 , 1.60 , 1.45]]
    //let cvd22:[[Double]] = [[1.08 , 1.02 , 0.930],[1.08 , 1.03 , 0.943]]
    //let cvd38:[[Double]] = [[0.626 , 0.608 , 0.563],[0.626 , 0.617 , 0.575]]
    //let cvd60:[[Double]] = [[0.397 , 0.400 , 0.377],[0.397 , 0.409 , 0.389]]
    //let cvd100:[[Double]] = [[0.239 , 0.257 , 0.249],[0.240 , 0.266 , 0.261]]
    //let cvd150:[[Double]] = [[0.159 , 0.183 , 0.182],[0.160 , 0.192 , 0.195]]
    //let cvd200:[[Double]] = [[0.121 , 0.150 , 0.153],[0.121 , 0.158 , 0.164]]
    //let cvd250:[[Double]] = [[0.0981 , 0.128 , 0.133],[0.0989 , 0.137 , 0.145]]
    //let cvd3235:[[Double]] = [[0.0764 , 0.108 , 0.115],[0.0775 , 0.116 , 0.126]]
}



        
        //UDs.set(voltDownArray, forKey: "voltDown")
        //UDs.set(voltDownRateArray, forKey: "voltDownRate")
        //let voltDownCalc1VC = self.storyboard?.instantiateViewController(identifier: "VoltDownCalc1ViewController") as! VoltDownCalc1ViewController
        //voltDownCalc1VC.a1 = String(voltDownArray[0])
        //print(voltDownCalc1VC.a1!)
        //voltDownCalc1VC.voltDown2.text = String(voltDownArray[1])
        //voltDownCalc1VC.voltDown3.text = String(voltDownArray[2])
        //voltDownCalc1VC.voltDown4.text = String(voltDownArray[3])
        //voltDownCalc1VC.voltDown5.text = String(voltDownArray[4])
    
    //override func viewWillAppear(_ animated: Bool) {
        //currentArray = UDs.array(forKey: "current") as! [Float]
        //current.text = String(currentArray[x-1])
        //distanceArray = UDs.array(forKey: "distance") as! [Float]
        //distance.text = String(distanceArray[x-1])
        //voltDownArray = UDs.array(forKey: "voltDown") as! [Float]
        //voltDown.text = String(voltDownArray[x-1])
        //voltDownRateArray = UDs.array(forKey: "voltDownRate") as! [Float]
        //voltDownRate.text = String(voltDownRateArray[x-1])
    //}
    
    //@IBAction func currentText(_ sender: Any) {
        //if let add1 = Float(current.text!) {
            //currentArray[x-1] = add1
            //UDs.set(currentArray, forKey: "current")
        //} else {
            //print("DEBUG current未入力")
        //}
    //}
    
    //@IBAction func distanceText(_ sender: Any) {
        //if let add2 = Float(distance.text!) {
            //distanceArray[x-1] = add2
            //UDs.set(distanceArray, forKey: "distance")
        //} else {
            //print("DEBUG2 distance未入力")
        //}
    //}
