//
//  PipeSizeCalcViewController.swift
//  Betelgeuse
//
//  Created by 由上博之 on 2021/07/22.
//

import UIKit

class PipeSizeCalcViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var cable11: UITextField!
    @IBOutlet weak var cable21: UITextField!
    @IBOutlet weak var cable31: UITextField!
    @IBOutlet weak var cable41: UITextField!
    @IBOutlet weak var cable51: UITextField!
    @IBOutlet weak var cable12: UITextField!
    @IBOutlet weak var cable22: UITextField!
    @IBOutlet weak var cable32: UITextField!
    @IBOutlet weak var cable42: UITextField!
    @IBOutlet weak var cable52: UITextField!
    @IBOutlet weak var quantity1: UITextField!
    @IBOutlet weak var quantity2: UITextField!
    @IBOutlet weak var quantity3: UITextField!
    @IBOutlet weak var quantity4: UITextField!
    @IBOutlet weak var quantity5: UITextField!
    @IBOutlet weak var area1: UILabel!
    @IBOutlet weak var area2: UILabel!
    @IBOutlet weak var area3: UILabel!
    @IBOutlet weak var area4: UILabel!
    @IBOutlet weak var area5: UILabel!
    @IBOutlet weak var totalArea: UILabel!
    @IBOutlet weak var pipeSizeG1: UILabel!
    @IBOutlet weak var pipeSizeG2: UILabel!
    @IBOutlet weak var pipeSizeE1: UILabel!
    @IBOutlet weak var pipeSizeE2: UILabel!
    @IBOutlet weak var standardG1: UILabel!
    @IBOutlet weak var standardG2: UILabel!
    @IBOutlet weak var standardE1: UILabel!
    @IBOutlet weak var standardE2: UILabel!
    
    var a1Text:Float = 0.0
    var a2Text:Float = 0.0
    var a3Text:Float = 0.0
    var a4Text:Float = 0.0
    var a5Text:Float = 0.0
    
    var editingTag = 0
    
    var pickerView11: UIPickerView = UIPickerView()
    var pickerView12: UIPickerView = UIPickerView()
    var pickerView13: UIPickerView = UIPickerView()
    var pickerView14: UIPickerView = UIPickerView()
    var pickerView15: UIPickerView = UIPickerView()
    var pickerView2: UIPickerView = UIPickerView()
    
    let list1 = ["CVV","CVVS","CV","CVD","CVT","CVQ","IV"]
    let list2 = ["1.25sq-2c","1.25sq-3c","1.25sq-4c","1.25sq-5c","1.25sq-6c","1.25sq-7c","1.25sq-8c","1.25sq-10c","1.25sq-12c","1.25sq-15c","1.25sq-20c","1.25sq-30c","2sq-2c","2sq-3c","2sq-4c","2sq-5c","2sq-6c","2sq-7c","2sq-8c","2sq-10c","2sq-12c","2sq-15c","2sq-20c","2sq-30c","3.5sq-2c","3.5sq-3c","3.5sq-4c","3.5sq-5c","3.5sq-6c","3.5sq-7c","3.5sq-8c","3.5sq-10c","3.5sq-12c","3.5sq-15c","3.5sq-20c","3.5sq-30c","5.5sq-2c","5.5sq-3c","5.5sq-4c","5.5sq-5c","5.5sq-6c","5.5sq-7c","5.5sq-8c","5.5sq-10c","5.5sq-12c","5.5sq-15c","5.5sq-20c"]
    let list3 = ["2sq-2c","2sq-3c","2sq-4c","3.5sq-2c","3.5sq-3c","3.5sq-4c","5.5sq-2c","5.5sq-3c","5.5sq-4c","8sq-2c","8sq-3c","8sq-4c","14sq-2c","14sq-3c","14sq-4c","22sq-2c","22sq-3c","22sq-4c","38sq-2c","38sq-3c","38sq-4c","60sq-2c","60sq-3c","60sq-4c","100sq-2c","100sq-3c","100sq-4c","150sq-2c","150sq-3c","150sq-4c","200sq-2c","200sq-3c","200sq-4c","250sq-2c","250sq-3c","250sq-4c"]
    let list4 = ["14sq","22sq","38sq","60sq","100sq","150sq","200sq","250sq","325sq"]
    let list5 = ["1.25sq","2sq","3.5sq","5.5sq","8sq","14sq","22sq","38sq","60sq","100sq","150sq","200sq","250sq","325sq"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let screenWidth = self.view.bounds.width
        //let draw = Draw(frame: CGRect(x:0, y:435, width:screenWidth, height: 10))
        //self.view.addSubview(draw)
        //draw.isOpaque = false
        
        view.backgroundColor = UIColor.init(red: 0.5, green: 1, blue: 0.5, alpha: 1.0)
        
        pickerView11.delegate = self
        pickerView11.dataSource = self
        pickerView11.tag = 11
        
        pickerView12.delegate = self
        pickerView12.dataSource = self
        pickerView12.tag = 12
        
        pickerView13.delegate = self
        pickerView13.dataSource = self
        pickerView13.tag = 13
        
        pickerView14.delegate = self
        pickerView14.dataSource = self
        pickerView14.tag = 14
        
        pickerView15.delegate = self
        pickerView15.dataSource = self
        pickerView15.tag = 15
        
        pickerView2.delegate = self
        pickerView2.dataSource = self
        
        cable11.delegate = self
        cable11.tag = 11
        cable21.delegate = self
        cable21.tag = 21
        cable31.delegate = self
        cable31.tag = 31
        cable41.delegate = self
        cable41.tag = 41
        cable51.delegate = self
        cable51.tag = 51
        cable12.delegate = self
        cable12.tag = 12
        cable22.delegate = self
        cable22.tag = 22
        cable32.delegate = self
        cable32.tag = 32
        cable42.delegate = self
        cable42.tag = 42
        cable52.delegate = self
        cable52.tag = 52
        quantity1.delegate = self
        quantity2.delegate = self
        quantity3.delegate = self
        quantity4.delegate = self
        quantity5.delegate = self
        
        let toolbar1 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let toolbar2 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let toolbar3 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let toolbar4 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let toolbar5 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let toolbar6 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let toolbar7 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let toolbar8 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let toolbar9 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let toolbar10 = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        
        let doneItem1 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PipeSizeCalcViewController.done1))
        let doneItem2 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PipeSizeCalcViewController.done2))
        let doneItem3 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PipeSizeCalcViewController.done3))
        let doneItem4 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PipeSizeCalcViewController.done4))
        let doneItem5 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PipeSizeCalcViewController.done5))
        let doneItem6 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PipeSizeCalcViewController.done6))
        let doneItem7 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PipeSizeCalcViewController.done7))
        let doneItem8 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PipeSizeCalcViewController.done8))
        let doneItem9 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PipeSizeCalcViewController.done9))
        let doneItem10 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PipeSizeCalcViewController.done10))
        
        let cancelItem1 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PipeSizeCalcViewController.cancel1))
        let cancelItem2 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PipeSizeCalcViewController.cancel2))
        let cancelItem3 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PipeSizeCalcViewController.cancel3))
        let cancelItem4 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PipeSizeCalcViewController.cancel4))
        let cancelItem5 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PipeSizeCalcViewController.cancel5))
        let cancelItem6 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PipeSizeCalcViewController.cancel6))
        let cancelItem7 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PipeSizeCalcViewController.cancel7))
        let cancelItem8 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PipeSizeCalcViewController.cancel8))
        let cancelItem9 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PipeSizeCalcViewController.cancel9))
        let cancelItem10 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PipeSizeCalcViewController.cancel10))
        
        toolbar1.setItems([cancelItem1, doneItem1], animated: true)
        toolbar2.setItems([cancelItem2, doneItem2], animated: true)
        toolbar3.setItems([cancelItem3, doneItem3], animated: true)
        toolbar4.setItems([cancelItem4, doneItem4], animated: true)
        toolbar5.setItems([cancelItem5, doneItem5], animated: true)
        toolbar6.setItems([cancelItem6, doneItem6], animated: true)
        toolbar7.setItems([cancelItem7, doneItem7], animated: true)
        toolbar8.setItems([cancelItem8, doneItem8], animated: true)
        toolbar9.setItems([cancelItem9, doneItem9], animated: true)
        toolbar10.setItems([cancelItem10, doneItem10], animated: true)
        
        self.cable11.inputView = pickerView11
        self.cable11.inputAccessoryView = toolbar1
        self.cable21.inputView = pickerView12
        self.cable21.inputAccessoryView = toolbar2
        self.cable31.inputView = pickerView13
        self.cable31.inputAccessoryView = toolbar3
        self.cable41.inputView = pickerView14
        self.cable41.inputAccessoryView = toolbar4
        self.cable51.inputView = pickerView15
        self.cable51.inputAccessoryView = toolbar5
        self.cable12.inputView = pickerView2
        self.cable12.inputAccessoryView = toolbar6
        self.cable22.inputView = pickerView2
        self.cable22.inputAccessoryView = toolbar7
        self.cable32.inputView = pickerView2
        self.cable32.inputAccessoryView = toolbar8
        self.cable42.inputView = pickerView2
        self.cable42.inputAccessoryView = toolbar9
        self.cable52.inputView = pickerView2
        self.cable52.inputAccessoryView = toolbar10
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        quantity1.resignFirstResponder()
        quantity2.resignFirstResponder()
        quantity3.resignFirstResponder()
        quantity4.resignFirstResponder()
        quantity5.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        editingTag = textField.tag
        if editingTag == cable11.tag {
            cable21.isEnabled = false
            cable31.isEnabled = false
            cable41.isEnabled = false
            cable51.isEnabled = false
            cable12.isEnabled = false
            cable22.isEnabled = false
            cable32.isEnabled = false
            cable42.isEnabled = false
            cable52.isEnabled = false
            quantity1.isEnabled = false
            quantity2.isEnabled = false
            quantity3.isEnabled = false
            quantity4.isEnabled = false
            quantity5.isEnabled = false
        } else if editingTag == cable21.tag {
            cable11.isEnabled = false
            cable31.isEnabled = false
            cable41.isEnabled = false
            cable51.isEnabled = false
            cable12.isEnabled = false
            cable22.isEnabled = false
            cable32.isEnabled = false
            cable42.isEnabled = false
            cable52.isEnabled = false
            quantity1.isEnabled = false
            quantity2.isEnabled = false
            quantity3.isEnabled = false
            quantity4.isEnabled = false
            quantity5.isEnabled = false
        } else if editingTag == cable31.tag {
            cable11.isEnabled = false
            cable21.isEnabled = false
            cable41.isEnabled = false
            cable51.isEnabled = false
            cable12.isEnabled = false
            cable22.isEnabled = false
            cable32.isEnabled = false
            cable42.isEnabled = false
            cable52.isEnabled = false
            quantity1.isEnabled = false
            quantity2.isEnabled = false
            quantity3.isEnabled = false
            quantity4.isEnabled = false
            quantity5.isEnabled = false
        } else if editingTag == cable41.tag {
            cable11.isEnabled = false
            cable21.isEnabled = false
            cable31.isEnabled = false
            cable51.isEnabled = false
            cable12.isEnabled = false
            cable22.isEnabled = false
            cable32.isEnabled = false
            cable42.isEnabled = false
            cable52.isEnabled = false
            quantity1.isEnabled = false
            quantity2.isEnabled = false
            quantity3.isEnabled = false
            quantity4.isEnabled = false
            quantity5.isEnabled = false
        } else if editingTag == cable51.tag {
            cable11.isEnabled = false
            cable21.isEnabled = false
            cable31.isEnabled = false
            cable41.isEnabled = false
            cable12.isEnabled = false
            cable22.isEnabled = false
            cable32.isEnabled = false
            cable42.isEnabled = false
            cable52.isEnabled = false
            quantity1.isEnabled = false
            quantity2.isEnabled = false
            quantity3.isEnabled = false
            quantity4.isEnabled = false
            quantity5.isEnabled = false
        } else if editingTag == cable12.tag {
            cable11.isEnabled = false
            cable21.isEnabled = false
            cable31.isEnabled = false
            cable41.isEnabled = false
            cable51.isEnabled = false
            cable22.isEnabled = false
            cable32.isEnabled = false
            cable42.isEnabled = false
            cable52.isEnabled = false
            quantity1.isEnabled = false
            quantity2.isEnabled = false
            quantity3.isEnabled = false
            quantity4.isEnabled = false
            quantity5.isEnabled = false
        } else if editingTag == cable22.tag {
            cable11.isEnabled = false
            cable21.isEnabled = false
            cable31.isEnabled = false
            cable41.isEnabled = false
            cable51.isEnabled = false
            cable12.isEnabled = false
            cable32.isEnabled = false
            cable42.isEnabled = false
            cable52.isEnabled = false
            quantity1.isEnabled = false
            quantity2.isEnabled = false
            quantity3.isEnabled = false
            quantity4.isEnabled = false
            quantity5.isEnabled = false
        } else if editingTag == cable32.tag {
            cable11.isEnabled = false
            cable21.isEnabled = false
            cable31.isEnabled = false
            cable41.isEnabled = false
            cable51.isEnabled = false
            cable12.isEnabled = false
            cable22.isEnabled = false
            cable42.isEnabled = false
            cable52.isEnabled = false
            quantity1.isEnabled = false
            quantity2.isEnabled = false
            quantity3.isEnabled = false
            quantity4.isEnabled = false
            quantity5.isEnabled = false
        } else if editingTag == cable42.tag {
            cable11.isEnabled = false
            cable21.isEnabled = false
            cable31.isEnabled = false
            cable41.isEnabled = false
            cable51.isEnabled = false
            cable12.isEnabled = false
            cable22.isEnabled = false
            cable32.isEnabled = false
            cable52.isEnabled = false
            quantity1.isEnabled = false
            quantity2.isEnabled = false
            quantity3.isEnabled = false
            quantity4.isEnabled = false
            quantity5.isEnabled = false
        } else if editingTag == cable52.tag {
            cable11.isEnabled = false
            cable21.isEnabled = false
            cable31.isEnabled = false
            cable41.isEnabled = false
            cable51.isEnabled = false
            cable12.isEnabled = false
            cable22.isEnabled = false
            cable32.isEnabled = false
            cable42.isEnabled = false
            quantity1.isEnabled = false
            quantity2.isEnabled = false
            quantity3.isEnabled = false
            quantity4.isEnabled = false
            quantity5.isEnabled = false
        }
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 11 || pickerView.tag == 12 || pickerView.tag == 13 || pickerView.tag == 14 || pickerView.tag == 15 {
            return list1.count
        } else if pickerView.tag == 21 {
            return list2.count
        } else if pickerView.tag == 22 {
            return list3.count
        } else if pickerView.tag == 23 {
            return list4.count
        } else if pickerView.tag == 24 {
            return list5.count
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 11 || pickerView.tag == 12 || pickerView.tag == 13 || pickerView.tag == 14 || pickerView.tag == 15 {
            return list1[row]
        } else if pickerView.tag == 21 {
            return list2[row]
        } else if pickerView.tag == 22 {
            return list3[row]
        } else if pickerView.tag == 23 {
            return list4[row]
        } else if pickerView.tag == 24 {
            return list5[row]
        } else {
            return "データ不足"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 11 {
            self.cable11.text = list1[row]
        } else if pickerView.tag == 12 {
            self.cable21.text = list1[row]
        } else if pickerView.tag == 13 {
            self.cable31.text = list1[row]
        } else if pickerView.tag == 14 {
            self.cable41.text = list1[row]
        } else if pickerView.tag == 15 {
            self.cable51.text = list1[row]
        } else if pickerView.tag == 21 {
            if editingTag == cable12.tag {
                self.cable12.text = list2[row]
            } else if editingTag == cable22.tag {
                self.cable22.text = list2[row]
            } else if editingTag == cable32.tag {
                self.cable32.text = list2[row]
            } else if editingTag == cable42.tag {
                self.cable42.text = list2[row]
            } else if editingTag == cable52.tag {
                self.cable52.text = list2[row]
            }
        } else if pickerView.tag == 22 {
            if editingTag == cable12.tag {
                self.cable12.text = list3[row]
            } else if editingTag == cable22.tag {
                self.cable22.text = list3[row]
            } else if editingTag == cable32.tag {
                self.cable32.text = list3[row]
            } else if editingTag == cable42.tag {
                self.cable42.text = list3[row]
            } else if editingTag == cable52.tag {
                self.cable52.text = list3[row]
            }
        } else if pickerView.tag == 23 {
            if editingTag == cable12.tag {
                self.cable12.text = list4[row]
            } else if editingTag == cable22.tag {
                self.cable22.text = list4[row]
            } else if editingTag == cable32.tag {
                self.cable32.text = list4[row]
            } else if editingTag == cable42.tag {
                self.cable42.text = list4[row]
            } else if editingTag == cable52.tag {
                self.cable52.text = list4[row]
            }
        } else if pickerView.tag == 24 {
            if editingTag == cable12.tag {
                self.cable12.text = list5[row]
            } else if editingTag == cable22.tag {
                self.cable22.text = list5[row]
            } else if editingTag == cable32.tag {
                self.cable32.text = list5[row]
            } else if editingTag == cable42.tag {
                self.cable42.text = list5[row]
            } else if editingTag == cable52.tag {
                self.cable52.text = list5[row]
            }
        }
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    @objc func done1() {
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
        if cable11.text == "CVV" || cable11.text == "CVVS" {
            pickerView2.tag = 21
        } else if cable11.text == "CV" {
            pickerView2.tag = 22
        } else if cable11.text == "CVD" || cable11.text == "CVT" || cable11.text == "CVQ" {
            pickerView2.tag = 23
        } else if cable11.text == "IV" {
            pickerView2.tag = 24
        }
        self.cable11.endEditing(true)
    }
    
    @objc func done2() {
        cable11.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
        if cable21.text == "CVV" || cable21.text == "CVVS" {
            pickerView2.tag = 21
        } else if cable21.text == "CV" {
            pickerView2.tag = 22
        } else if cable21.text == "CVD" || cable21.text == "CVT" || cable21.text == "CVQ" {
            pickerView2.tag = 23
        } else if cable21.text == "IV" {
            pickerView2.tag = 24
        }
        self.cable21.endEditing(true)
    }
    
    @objc func done3() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
        if cable31.text == "CVV" || cable31.text == "CVVS" {
            pickerView2.tag = 21
        } else if cable31.text == "CV" {
            pickerView2.tag = 22
        } else if cable31.text == "CVD" || cable31.text == "CVT" || cable31.text == "CVQ" {
            pickerView2.tag = 23
        } else if cable31.text == "IV" {
            pickerView2.tag = 24
        }
        self.cable31.endEditing(true)
    }
    
    @objc func done4() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
        if cable41.text == "CVV" || cable41.text == "CVVS" {
            pickerView2.tag = 21
        } else if cable41.text == "CV" {
            pickerView2.tag = 22
        } else if cable41.text == "CVD" || cable41.text == "CVT" || cable41.text == "CVQ" {
            pickerView2.tag = 23
        } else if cable41.text == "IV" {
            pickerView2.tag = 24
        }
        self.cable41.endEditing(true)
    }
    
    @objc func done5() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
        if cable51.text == "CVV" || cable51.text == "CVVS" {
            pickerView2.tag = 21
        } else if cable51.text == "CV" {
            pickerView2.tag = 22
        } else if cable51.text == "CVD" || cable51.text == "CVT" || cable51.text == "CVQ" {
            pickerView2.tag = 23
        } else if cable51.text == "IV" {
            pickerView2.tag = 24
        }
        self.cable51.endEditing(true)
    }
    
    @objc func done6() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable12.endEditing(true)
    }
    
    @objc func done7() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable22.endEditing(true)
    }
    
    @objc func done8() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable32.endEditing(true)
    }
    
    @objc func done9() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable42.endEditing(true)
    }
    
    @objc func done10() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable52.endEditing(true)
    }
    
    @objc func cancel1() {
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable11.text = ""
            self.cable11.endEditing(true)
    }
    
    @objc func cancel2() {
        cable11.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable21.text = ""
            self.cable21.endEditing(true)
    }
    
    @objc func cancel3() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable31.text = ""
            self.cable31.endEditing(true)
    }
    
    @objc func cancel4() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable41.text = ""
            self.cable41.endEditing(true)
    }
    
    @objc func cancel5() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable51.text = ""
            self.cable51.endEditing(true)
    }
    
    @objc func cancel6() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable12.text = ""
            self.cable12.endEditing(true)
    }
    
    @objc func cancel7() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable22.text = ""
            self.cable22.endEditing(true)
    }
    
    @objc func cancel8() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable42.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable32.text = ""
            self.cable32.endEditing(true)
    }
    
    @objc func cancel9() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable52.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable42.text = ""
            self.cable42.endEditing(true)
    }
    
    @objc func cancel10() {
        cable11.isEnabled = true
        cable21.isEnabled = true
        cable31.isEnabled = true
        cable41.isEnabled = true
        cable51.isEnabled = true
        cable12.isEnabled = true
        cable22.isEnabled = true
        cable32.isEnabled = true
        cable42.isEnabled = true
        quantity1.isEnabled = true
        quantity2.isEnabled = true
        quantity3.isEnabled = true
        quantity4.isEnabled = true
        quantity5.isEnabled = true
            self.cable52.text = ""
            self.cable52.endEditing(true)
    }
    
    @IBAction func calc(_ sender: Any) {
        if cable11.text == "CVV" {
            if cable12.text == "1.25sq-2c" {
                a1Text = pow((9.1/2),2) * Float.pi
            } else if cable12.text == "1.25sq-3c" {
                a1Text = pow((9.6/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-4c" {
                a1Text = pow((10.5/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-5c" {
                a1Text = pow((11.5/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-6c" {
                a1Text = pow((12.0/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-7c" {
                a1Text = pow((12.0/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-8c" {
                a1Text = pow((13.0/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-10c" {
                a1Text = pow((15.0/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-12c" {
                a1Text = pow((15.5/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-15c" {
                a1Text = pow((17.0/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-20c" {
                a1Text = pow((18.5/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-30c" {
                a1Text = pow((23.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-2c" {
                a1Text = pow((10.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-3c" {
                a1Text = pow((11.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-4c" {
                a1Text = pow((11.5/2), 2) * Float.pi
            } else if cable12.text == "2sq-5c" {
                a1Text = pow((12.5/2), 2) * Float.pi
            } else if cable12.text == "2sq-6c" {
                a1Text = pow((13.5/2), 2) * Float.pi
            } else if cable12.text == "2sq-7c" {
                a1Text = pow((13.5/2), 2) * Float.pi
            } else if cable12.text == "2sq-8c" {
                a1Text = pow((14.5/2), 2) * Float.pi
            } else if cable12.text == "2sq-10c" {
                a1Text = pow((17.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-12c" {
                a1Text = pow((17.5/2), 2) * Float.pi
            } else if cable12.text == "2sq-15c" {
                a1Text = pow((19.5/2), 2) * Float.pi
            } else if cable12.text == "2sq-20c" {
                a1Text = pow((21.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-30c" {
                a1Text = pow((26.0/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-2c" {
                a1Text = pow((11.5/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-3c" {
                a1Text = pow((12.0/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-4c" {
                a1Text = pow((13.0/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-5c" {
                a1Text = pow((14.0/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-6c" {
                a1Text = pow((15.5/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-7c" {
                a1Text = pow((15.5/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-8c" {
                a1Text = pow((16.5/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-10c" {
                a1Text = pow((19.5/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-12c" {
                a1Text = pow((20/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-15c" {
                a1Text = pow((22/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-20c" {
                a1Text = pow((24/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-30c" {
                a1Text = pow((30/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-2c" {
                a1Text = pow((13.5/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-3c" {
                a1Text = pow((14.0/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-4c" {
                a1Text = pow((15.5/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-5c" {
                a1Text = pow((17.0/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-6c" {
                a1Text = pow((18.5/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-7c" {
                a1Text = pow((18.5/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-8c" {
                a1Text = pow((20/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-10c" {
                a1Text = pow((24/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-12c" {
                a1Text = pow((25/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-15c" {
                a1Text = pow((27/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-20c" {
                a1Text = pow((30/2), 2) * Float.pi
            }
        } else if cable11.text == "CVVS" {
            if cable12.text == "1.25sq-2c" {
                a1Text = pow((9.6/2),2) * Float.pi
            } else if cable12.text == "1.25sq-3c" {
                a1Text = pow((10.5/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-4c" {
                a1Text = pow((11.0/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-5c" {
                a1Text = pow((12.0/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-6c" {
                a1Text = pow((13.0/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-7c" {
                a1Text = pow((13.0/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-8c" {
                a1Text = pow((13.5/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-10c" {
                a1Text = pow((15.5/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-12c" {
                a1Text = pow((16.0/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-15c" {
                a1Text = pow((17.0/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-20c" {
                a1Text = pow((19.0/2), 2) * Float.pi
            } else if cable12.text == "1.25sq-30c" {
                a1Text = pow((23.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-2c" {
                a1Text = pow((10.5/2), 2) * Float.pi
            } else if cable12.text == "2sq-3c" {
                a1Text = pow((11.5/2), 2) * Float.pi
            } else if cable12.text == "2sq-4c" {
                a1Text = pow((12.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-5c" {
                a1Text = pow((13.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-6c" {
                a1Text = pow((14.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-7c" {
                a1Text = pow((14.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-8c" {
                a1Text = pow((15.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-10c" {
                a1Text = pow((17.5/2), 2) * Float.pi
            } else if cable12.text == "2sq-12c" {
                a1Text = pow((18.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-15c" {
                a1Text = pow((19.5/2), 2) * Float.pi
            } else if cable12.text == "2sq-20c" {
                a1Text = pow((22.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-30c" {
                a1Text = pow((26.0/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-2c" {
                a1Text = pow((12.0/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-3c" {
                a1Text = pow((12.5/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-4c" {
                a1Text = pow((13.5/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-5c" {
                a1Text = pow((14.5/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-6c" {
                a1Text = pow((16.0/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-7c" {
                a1Text = pow((16.0/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-8c" {
                a1Text = pow((17.0/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-10c" {
                a1Text = pow((20/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-12c" {
                a1Text = pow((21/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-15c" {
                a1Text = pow((22/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-20c" {
                a1Text = pow((25/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-30c" {
                a1Text = pow((30/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-2c" {
                a1Text = pow((14.0/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-3c" {
                a1Text = pow((14.5/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-4c" {
                a1Text = pow((16.0/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-5c" {
                a1Text = pow((17.5/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-6c" {
                a1Text = pow((19.0/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-7c" {
                a1Text = pow((19.0/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-8c" {
                a1Text = pow((21/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-10c" {
                a1Text = pow((24/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-12c" {
                a1Text = pow((25/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-15c" {
                a1Text = pow((27/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-20c" {
                a1Text = pow((31/2), 2) * Float.pi
            }
        } else if cable11.text == "CV" {
            if cable12.text == "2sq-2c" {
                a1Text = pow((10.5/2), 2) * Float.pi
            } else if cable12.text == "2sq-3c" {
                a1Text = pow((11.0/2), 2) * Float.pi
            } else if cable12.text == "2sq-4c" {
                a1Text = pow((12.0/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-2c" {
                a1Text = pow((11.5/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-3c" {
                a1Text = pow((12.5/2), 2) * Float.pi
            } else if cable12.text == "3.5sq-4c" {
                a1Text = pow((13.5/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-2c" {
                a1Text = pow((13.5/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-3c" {
                a1Text = pow((14.5/2), 2) * Float.pi
            } else if cable12.text == "5.5sq-4c" {
                a1Text = pow((16.0/2), 2) * Float.pi
            } else if cable12.text == "8sq-2c" {
                a1Text = pow((15.0/2), 2) * Float.pi
            } else if cable12.text == "8sq-3c" {
                a1Text = pow((16.0/2), 2) * Float.pi
            } else if cable12.text == "8sq-4c" {
                a1Text = pow((17.0/2), 2) * Float.pi
            } else if cable12.text == "14sq-2c" {
                a1Text = pow((16.5/2), 2) * Float.pi
            } else if cable12.text == "14sq-3c" {
                a1Text = pow((17.5/2), 2) * Float.pi
            } else if cable12.text == "14sq-4c" {
                a1Text = pow((19.0/2), 2) * Float.pi
            } else if cable12.text == "22sq-2c" {
                a1Text = pow((19.5/2), 2) * Float.pi
            } else if cable12.text == "22sq-3c" {
                a1Text = pow((21.0/2), 2) * Float.pi
            } else if cable12.text == "22sq-4c" {
                a1Text = pow((23.0/2), 2) * Float.pi
            } else if cable12.text == "38sq-2c" {
                a1Text = pow((24.0/2), 2) * Float.pi
            } else if cable12.text == "38sq-3c" {
                a1Text = pow((25.0/2), 2) * Float.pi
            } else if cable12.text == "38sq-4c" {
                a1Text = pow((28.0/2), 2) * Float.pi
            } else if cable12.text == "60sq-2c" {
                a1Text = pow((29.0/2), 2) * Float.pi
            } else if cable12.text == "60sq-3c" {
                a1Text = pow((31.0/2), 2) * Float.pi
            } else if cable12.text == "60sq-4c" {
                a1Text = pow((35.0/2), 2) * Float.pi
            } else if cable12.text == "100sq-2c" {
                a1Text = pow((37.0/2), 2) * Float.pi
            } else if cable12.text == "100sq-3c" {
                a1Text = pow((40.0/2), 2) * Float.pi
            } else if cable12.text == "100sq-4c" {
                a1Text = pow((44.0/2), 2) * Float.pi
            } else if cable12.text == "150sq-2c" {
                a1Text = pow((43.0/2), 2) * Float.pi
            } else if cable12.text == "150sq-3c" {
                a1Text = pow((46.0/2), 2) * Float.pi
            } else if cable12.text == "150sq-4c" {
                a1Text = pow((51.0/2), 2) * Float.pi
            } else if cable12.text == "200sq-2c" {
                a1Text = pow((50.0/2), 2) * Float.pi
            } else if cable12.text == "200sq-3c" {
                a1Text = pow((54.0/2), 2) * Float.pi
            } else if cable12.text == "200sq-4c" {
                a1Text = pow((60.0/2), 2) * Float.pi
            } else if cable12.text == "250sq-2c" {
                a1Text = pow((54.0/2), 2) * Float.pi
            } else if cable12.text == "250sq-3c" {
                a1Text = pow((58.0/2), 2) * Float.pi
            } else if cable12.text == "250sq-4c" {
                a1Text = pow((65.0/2), 2) * Float.pi
            } else if cable12.text == "325sq-2c" {
                a1Text = pow((60.0/2), 2) * Float.pi
            } else if cable12.text == "325sq-3c" {
                a1Text = pow((65.0/2), 2) * Float.pi
            } else if cable12.text == "325sq-4c" {
                a1Text = pow((72.0/2), 2) * Float.pi
            }
        } else if cable11.text == "CVD" {
            if cable12.text == "14sq" {
                a1Text = pow((19/2), 2) * Float.pi
            } else if cable12.text == "22sq" {
                a1Text = pow((22/2), 2) * Float.pi
            } else if cable12.text == "38sq" {
                a1Text = pow((26/2), 2) * Float.pi
            } else if cable12.text == "60sq" {
                a1Text = pow((31/2), 2) * Float.pi
            } else if cable12.text == "100sq" {
                a1Text = pow((38/2), 2) * Float.pi
            } else if cable12.text == "150sq" {
                a1Text = pow((44/2), 2) * Float.pi
            } else if cable12.text == "200sq" {
                a1Text = pow((51/2), 2) * Float.pi
            } else if cable12.text == "250sq" {
                a1Text = pow((55/2), 2) * Float.pi
            } else if cable12.text == "325sq" {
                a1Text = pow((61/2), 2) * Float.pi
            }
        } else if cable11.text == "CVT" {
            if cable12.text == "14sq" {
                a1Text = pow((21/2), 2) * Float.pi
            } else if cable12.text == "22sq" {
                a1Text = pow((24/2), 2) * Float.pi
            } else if cable12.text == "38sq" {
                a1Text = pow((28/2), 2) * Float.pi
            } else if cable12.text == "60sq" {
                a1Text = pow((33/2), 2) * Float.pi
            } else if cable12.text == "100sq" {
                a1Text = pow((41/2), 2) * Float.pi
            } else if cable12.text == "150sq" {
                a1Text = pow((47/2), 2) * Float.pi
            } else if cable12.text == "200sq" {
                a1Text = pow((55/2), 2) * Float.pi
            } else if cable12.text == "250sq" {
                a1Text = pow((60/2), 2) * Float.pi
            } else if cable12.text == "325sq" {
                a1Text = pow((66/2), 2) * Float.pi
            }
        } else if cable11.text == "CVQ" {
            if cable12.text == "14sq" {
                a1Text = pow((23/2), 2) * Float.pi
            } else if cable12.text == "22sq" {
                a1Text = pow((27/2), 2) * Float.pi
            } else if cable12.text == "38sq" {
                a1Text = pow((31/2), 2) * Float.pi
            } else if cable12.text == "60sq" {
                a1Text = pow((37/2), 2) * Float.pi
            } else if cable12.text == "100sq" {
                a1Text = pow((46/2), 2) * Float.pi
            } else if cable12.text == "150sq" {
                a1Text = pow((53/2), 2) * Float.pi
            } else if cable12.text == "200sq" {
                a1Text = pow((61/2), 2) * Float.pi
            } else if cable12.text == "250sq" {
                a1Text = pow((67/2), 2) * Float.pi
            } else if cable12.text == "325sq" {
                a1Text = pow((74/2), 2) * Float.pi
            }
        } else if cable11.text == "IV" {
            if cable12.text == "1.25sq" {
                a1Text = pow((3.0/2), 2) * Float.pi
            } else if cable12.text == "2sq" {
                a1Text = pow((3.4/2), 2) * Float.pi
            } else if cable12.text == "3.5sq" {
                a1Text = pow((4.0/2), 2) * Float.pi
            } else if cable12.text == "5.5sq" {
                a1Text = pow((5.0/2), 2) * Float.pi
            } else if cable12.text == "8sq" {
                a1Text = pow((6.0/2), 2) * Float.pi
            } else if cable12.text == "14sq" {
                a1Text = pow((7.6/2), 2) * Float.pi
            } else if cable12.text == "22sq" {
                a1Text = pow((9.2/2), 2) * Float.pi
            } else if cable12.text == "38sq" {
                a1Text = pow((11.5/2), 2) * Float.pi
            } else if cable12.text == "60sq" {
                a1Text = pow((14.0/2), 2) * Float.pi
            } else if cable12.text == "100sq" {
                a1Text = pow((17.0/2), 2) * Float.pi
            } else if cable12.text == "150sq" {
                a1Text = pow((21/2), 2) * Float.pi
            } else if cable12.text == "200sq" {
                a1Text = pow((23/2), 2) * Float.pi
            } else if cable12.text == "250sq" {
                a1Text = pow((26/2), 2) * Float.pi
            } else if cable12.text == "325sq" {
                a1Text = pow((29/2), 2) * Float.pi
            }
        }
        
        if cable21.text == "CVV" {
            if cable22.text == "1.25sq-2c" {
                a2Text = pow((9.1/2),2) * Float.pi
            } else if cable22.text == "1.25sq-3c" {
                a2Text = pow((9.6/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-4c" {
                a2Text = pow((10.5/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-5c" {
                a2Text = pow((11.5/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-6c" {
                a2Text = pow((12.0/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-7c" {
                a2Text = pow((12.0/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-8c" {
                a2Text = pow((13.0/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-10c" {
                a2Text = pow((15.0/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-12c" {
                a2Text = pow((15.5/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-15c" {
                a2Text = pow((17.0/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-20c" {
                a2Text = pow((18.5/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-30c" {
                a2Text = pow((23.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-2c" {
                a2Text = pow((10.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-3c" {
                a2Text = pow((11.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-4c" {
                a2Text = pow((11.5/2), 2) * Float.pi
            } else if cable22.text == "2sq-5c" {
                a2Text = pow((12.5/2), 2) * Float.pi
            } else if cable22.text == "2sq-6c" {
                a2Text = pow((13.5/2), 2) * Float.pi
            } else if cable22.text == "2sq-7c" {
                a2Text = pow((13.5/2), 2) * Float.pi
            } else if cable22.text == "2sq-8c" {
                a2Text = pow((14.5/2), 2) * Float.pi
            } else if cable22.text == "2sq-10c" {
                a2Text = pow((17.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-12c" {
                a2Text = pow((17.5/2), 2) * Float.pi
            } else if cable22.text == "2sq-15c" {
                a2Text = pow((19.5/2), 2) * Float.pi
            } else if cable22.text == "2sq-20c" {
                a2Text = pow((21.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-30c" {
                a2Text = pow((26.0/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-2c" {
                a2Text = pow((11.5/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-3c" {
                a2Text = pow((12.0/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-4c" {
                a2Text = pow((13.0/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-5c" {
                a2Text = pow((14.0/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-6c" {
                a2Text = pow((15.5/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-7c" {
                a2Text = pow((15.5/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-8c" {
                a2Text = pow((16.5/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-10c" {
                a2Text = pow((19.5/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-12c" {
                a2Text = pow((20/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-15c" {
                a2Text = pow((22/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-20c" {
                a2Text = pow((24/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-30c" {
                a2Text = pow((30/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-2c" {
                a2Text = pow((13.5/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-3c" {
                a2Text = pow((14.0/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-4c" {
                a2Text = pow((15.5/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-5c" {
                a2Text = pow((17.0/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-6c" {
                a2Text = pow((18.5/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-7c" {
                a2Text = pow((18.5/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-8c" {
                a2Text = pow((20/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-10c" {
                a2Text = pow((24/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-12c" {
                a2Text = pow((25/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-15c" {
                a2Text = pow((27/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-20c" {
                a2Text = pow((30/2), 2) * Float.pi
            }
        } else if cable21.text == "CVVS" {
            if cable22.text == "1.25sq-2c" {
                a2Text = pow((9.6/2),2) * Float.pi
            } else if cable22.text == "1.25sq-3c" {
                a2Text = pow((10.5/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-4c" {
                a2Text = pow((11.0/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-5c" {
                a2Text = pow((12.0/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-6c" {
                a2Text = pow((13.0/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-7c" {
                a2Text = pow((13.0/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-8c" {
                a2Text = pow((13.5/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-10c" {
                a2Text = pow((15.5/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-12c" {
                a2Text = pow((16.0/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-15c" {
                a2Text = pow((17.0/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-20c" {
                a2Text = pow((19.0/2), 2) * Float.pi
            } else if cable22.text == "1.25sq-30c" {
                a2Text = pow((23.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-2c" {
                a2Text = pow((10.5/2), 2) * Float.pi
            } else if cable22.text == "2sq-3c" {
                a2Text = pow((11.5/2), 2) * Float.pi
            } else if cable22.text == "2sq-4c" {
                a2Text = pow((12.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-5c" {
                a2Text = pow((13.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-6c" {
                a2Text = pow((14.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-7c" {
                a2Text = pow((14.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-8c" {
                a2Text = pow((15.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-10c" {
                a2Text = pow((17.5/2), 2) * Float.pi
            } else if cable22.text == "2sq-12c" {
                a2Text = pow((18.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-15c" {
                a2Text = pow((19.5/2), 2) * Float.pi
            } else if cable22.text == "2sq-20c" {
                a2Text = pow((22.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-30c" {
                a2Text = pow((26.0/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-2c" {
                a2Text = pow((12.0/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-3c" {
                a2Text = pow((12.5/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-4c" {
                a2Text = pow((13.5/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-5c" {
                a2Text = pow((14.5/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-6c" {
                a2Text = pow((16.0/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-7c" {
                a2Text = pow((16.0/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-8c" {
                a2Text = pow((17.0/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-10c" {
                a2Text = pow((20/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-12c" {
                a2Text = pow((21/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-15c" {
                a2Text = pow((22/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-20c" {
                a2Text = pow((25/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-30c" {
                a2Text = pow((30/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-2c" {
                a2Text = pow((14.0/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-3c" {
                a2Text = pow((14.5/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-4c" {
                a2Text = pow((16.0/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-5c" {
                a2Text = pow((17.5/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-6c" {
                a2Text = pow((19.0/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-7c" {
                a2Text = pow((19.0/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-8c" {
                a2Text = pow((21/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-10c" {
                a2Text = pow((24/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-12c" {
                a2Text = pow((25/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-15c" {
                a2Text = pow((27/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-20c" {
                a2Text = pow((31/2), 2) * Float.pi
            }
        } else if cable21.text == "CV" {
            if cable22.text == "2sq-2c" {
                a2Text = pow((10.5/2), 2) * Float.pi
            } else if cable22.text == "2sq-3c" {
                a2Text = pow((11.0/2), 2) * Float.pi
            } else if cable22.text == "2sq-4c" {
                a2Text = pow((12.0/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-2c" {
                a2Text = pow((11.5/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-3c" {
                a2Text = pow((12.5/2), 2) * Float.pi
            } else if cable22.text == "3.5sq-4c" {
                a2Text = pow((13.5/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-2c" {
                a2Text = pow((13.5/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-3c" {
                a2Text = pow((14.5/2), 2) * Float.pi
            } else if cable22.text == "5.5sq-4c" {
                a2Text = pow((16.0/2), 2) * Float.pi
            } else if cable22.text == "8sq-2c" {
                a2Text = pow((15.0/2), 2) * Float.pi
            } else if cable22.text == "8sq-3c" {
                a2Text = pow((16.0/2), 2) * Float.pi
            } else if cable22.text == "8sq-4c" {
                a2Text = pow((17.0/2), 2) * Float.pi
            } else if cable22.text == "14sq-2c" {
                a2Text = pow((16.5/2), 2) * Float.pi
            } else if cable22.text == "14sq-3c" {
                a2Text = pow((17.5/2), 2) * Float.pi
            } else if cable22.text == "14sq-4c" {
                a2Text = pow((19.0/2), 2) * Float.pi
            } else if cable22.text == "22sq-2c" {
                a2Text = pow((19.5/2), 2) * Float.pi
            } else if cable22.text == "22sq-3c" {
                a2Text = pow((21.0/2), 2) * Float.pi
            } else if cable22.text == "22sq-4c" {
                a2Text = pow((23.0/2), 2) * Float.pi
            } else if cable22.text == "38sq-2c" {
                a2Text = pow((24.0/2), 2) * Float.pi
            } else if cable22.text == "38sq-3c" {
                a2Text = pow((25.0/2), 2) * Float.pi
            } else if cable22.text == "38sq-4c" {
                a2Text = pow((28.0/2), 2) * Float.pi
            } else if cable22.text == "60sq-2c" {
                a2Text = pow((29.0/2), 2) * Float.pi
            } else if cable22.text == "60sq-3c" {
                a2Text = pow((31.0/2), 2) * Float.pi
            } else if cable22.text == "60sq-4c" {
                a2Text = pow((35.0/2), 2) * Float.pi
            } else if cable22.text == "100sq-2c" {
                a2Text = pow((37.0/2), 2) * Float.pi
            } else if cable22.text == "100sq-3c" {
                a2Text = pow((40.0/2), 2) * Float.pi
            } else if cable22.text == "100sq-4c" {
                a2Text = pow((44.0/2), 2) * Float.pi
            } else if cable22.text == "150sq-2c" {
                a2Text = pow((43.0/2), 2) * Float.pi
            } else if cable22.text == "150sq-3c" {
                a2Text = pow((46.0/2), 2) * Float.pi
            } else if cable22.text == "150sq-4c" {
                a2Text = pow((51.0/2), 2) * Float.pi
            } else if cable22.text == "200sq-2c" {
                a2Text = pow((50.0/2), 2) * Float.pi
            } else if cable22.text == "200sq-3c" {
                a2Text = pow((54.0/2), 2) * Float.pi
            } else if cable22.text == "200sq-4c" {
                a2Text = pow((60.0/2), 2) * Float.pi
            } else if cable22.text == "250sq-2c" {
                a2Text = pow((54.0/2), 2) * Float.pi
            } else if cable22.text == "250sq-3c" {
                a2Text = pow((58.0/2), 2) * Float.pi
            } else if cable22.text == "250sq-4c" {
                a2Text = pow((65.0/2), 2) * Float.pi
            } else if cable22.text == "325sq-2c" {
                a2Text = pow((60.0/2), 2) * Float.pi
            } else if cable22.text == "325sq-3c" {
                a2Text = pow((65.0/2), 2) * Float.pi
            } else if cable22.text == "325sq-4c" {
                a2Text = pow((72.0/2), 2) * Float.pi
            }
        } else if cable21.text == "CVD" {
            if cable22.text == "14sq" {
                a2Text = pow((19/2), 2) * Float.pi
            } else if cable22.text == "22sq" {
                a2Text = pow((22/2), 2) * Float.pi
            } else if cable22.text == "38sq" {
                a2Text = pow((25/2), 2) * Float.pi
            } else if cable22.text == "60sq" {
                a2Text = pow((31/2), 2) * Float.pi
            } else if cable22.text == "100sq" {
                a2Text = pow((38/2), 2) * Float.pi
            } else if cable22.text == "150sq" {
                a2Text = pow((44/2), 2) * Float.pi
            } else if cable22.text == "200sq" {
                a2Text = pow((51/2), 2) * Float.pi
            } else if cable22.text == "250sq" {
                a2Text = pow((55/2), 2) * Float.pi
            } else if cable22.text == "325sq" {
                a2Text = pow((61/2), 2) * Float.pi
            }
        } else if cable21.text == "CVT" {
            if cable22.text == "14sq" {
                a2Text = pow((21/2), 2) * Float.pi
            } else if cable22.text == "22sq" {
                a2Text = pow((24/2), 2) * Float.pi
            } else if cable22.text == "38sq" {
                a2Text = pow((28/2), 2) * Float.pi
            } else if cable22.text == "60sq" {
                a2Text = pow((33/2), 2) * Float.pi
            } else if cable22.text == "100sq" {
                a2Text = pow((41/2), 2) * Float.pi
            } else if cable22.text == "150sq" {
                a2Text = pow((47/2), 2) * Float.pi
            } else if cable22.text == "200sq" {
                a2Text = pow((55/2), 2) * Float.pi
            } else if cable22.text == "250sq" {
                a2Text = pow((60/2), 2) * Float.pi
            } else if cable22.text == "325sq" {
                a2Text = pow((66/2), 2) * Float.pi
            }
        } else if cable21.text == "CVQ" {
            if cable22.text == "14sq" {
                a2Text = pow((23/2), 2) * Float.pi
            } else if cable22.text == "22sq" {
                a2Text = pow((27/2), 2) * Float.pi
            } else if cable22.text == "38sq" {
                a2Text = pow((31/2), 2) * Float.pi
            } else if cable22.text == "60sq" {
                a2Text = pow((37/2), 2) * Float.pi
            } else if cable22.text == "100sq" {
                a2Text = pow((46/2), 2) * Float.pi
            } else if cable22.text == "150sq" {
                a2Text = pow((53/2), 2) * Float.pi
            } else if cable22.text == "200sq" {
                a2Text = pow((61/2), 2) * Float.pi
            } else if cable22.text == "250sq" {
                a2Text = pow((67/2), 2) * Float.pi
            } else if cable22.text == "325sq" {
                a2Text = pow((74/2), 2) * Float.pi
            }
        } else if cable21.text == "IV" {
            if cable22.text == "1.25sq" {
                a2Text = pow((3.0/2), 2) * Float.pi
            } else if cable22.text == "2sq" {
                a2Text = pow((3.4/2), 2) * Float.pi
            } else if cable22.text == "3.5sq" {
                a2Text = pow((4.0/2), 2) * Float.pi
            } else if cable22.text == "5.5sq" {
                a2Text = pow((5.0/2), 2) * Float.pi
            } else if cable22.text == "8sq" {
                a2Text = pow((6.0/2), 2) * Float.pi
            } else if cable22.text == "14sq" {
                a2Text = pow((7.6/2), 2) * Float.pi
            } else if cable22.text == "22sq" {
                a2Text = pow((9.2/2), 2) * Float.pi
            } else if cable22.text == "38sq" {
                a2Text = pow((11.5/2), 2) * Float.pi
            } else if cable22.text == "60sq" {
                a2Text = pow((14.0/2), 2) * Float.pi
            } else if cable22.text == "100sq" {
                a2Text = pow((17.0/2), 2) * Float.pi
            } else if cable22.text == "150sq" {
                a2Text = pow((21/2), 2) * Float.pi
            } else if cable22.text == "200sq" {
                a2Text = pow((23/2), 2) * Float.pi
            } else if cable22.text == "250sq" {
                a2Text = pow((26/2), 2) * Float.pi
            } else if cable22.text == "325sq" {
                a2Text = pow((29/2), 2) * Float.pi
            }
        }
        
        if cable31.text == "CVV" {
            if cable32.text == "1.25sq-2c" {
                a3Text = pow((9.1/2),2) * Float.pi
            } else if cable32.text == "1.25sq-3c" {
                a3Text = pow((9.6/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-4c" {
                a3Text = pow((10.5/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-5c" {
                a3Text = pow((11.5/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-6c" {
                a3Text = pow((12.0/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-7c" {
                a3Text = pow((12.0/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-8c" {
                a3Text = pow((13.0/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-10c" {
                a3Text = pow((15.0/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-12c" {
                a3Text = pow((15.5/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-15c" {
                a3Text = pow((17.0/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-20c" {
                a3Text = pow((18.5/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-30c" {
                a3Text = pow((23.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-2c" {
                a3Text = pow((10.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-3c" {
                a3Text = pow((11.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-4c" {
                a3Text = pow((11.5/2), 2) * Float.pi
            } else if cable32.text == "2sq-5c" {
                a3Text = pow((12.5/2), 2) * Float.pi
            } else if cable32.text == "2sq-6c" {
                a3Text = pow((13.5/2), 2) * Float.pi
            } else if cable32.text == "2sq-7c" {
                a3Text = pow((13.5/2), 2) * Float.pi
            } else if cable32.text == "2sq-8c" {
                a3Text = pow((14.5/2), 2) * Float.pi
            } else if cable32.text == "2sq-10c" {
                a3Text = pow((17.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-12c" {
                a3Text = pow((17.5/2), 2) * Float.pi
            } else if cable32.text == "2sq-15c" {
                a3Text = pow((19.5/2), 2) * Float.pi
            } else if cable32.text == "2sq-20c" {
                a3Text = pow((21.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-30c" {
                a3Text = pow((26.0/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-2c" {
                a3Text = pow((11.5/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-3c" {
                a3Text = pow((12.0/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-4c" {
                a3Text = pow((13.0/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-5c" {
                a3Text = pow((14.0/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-6c" {
                a3Text = pow((15.5/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-7c" {
                a3Text = pow((15.5/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-8c" {
                a3Text = pow((16.5/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-10c" {
                a3Text = pow((19.5/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-12c" {
                a3Text = pow((20/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-15c" {
                a3Text = pow((22/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-20c" {
                a3Text = pow((24/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-30c" {
                a3Text = pow((30/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-2c" {
                a3Text = pow((13.5/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-3c" {
                a3Text = pow((14.0/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-4c" {
                a3Text = pow((15.5/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-5c" {
                a3Text = pow((17.0/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-6c" {
                a3Text = pow((18.5/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-7c" {
                a3Text = pow((18.5/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-8c" {
                a3Text = pow((20/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-10c" {
                a3Text = pow((24/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-12c" {
                a3Text = pow((25/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-15c" {
                a3Text = pow((27/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-20c" {
                a3Text = pow((30/2), 2) * Float.pi
            }
        } else if cable31.text == "CVVS" {
            if cable32.text == "1.25sq-2c" {
                a3Text = pow((9.6/2),2) * Float.pi
            } else if cable32.text == "1.25sq-3c" {
                a3Text = pow((10.5/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-4c" {
                a3Text = pow((11.0/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-5c" {
                a3Text = pow((12.0/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-6c" {
                a3Text = pow((13.0/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-7c" {
                a3Text = pow((13.0/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-8c" {
                a3Text = pow((13.5/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-10c" {
                a3Text = pow((15.5/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-12c" {
                a3Text = pow((16.0/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-15c" {
                a3Text = pow((17.0/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-20c" {
                a3Text = pow((19.0/2), 2) * Float.pi
            } else if cable32.text == "1.25sq-30c" {
                a3Text = pow((23.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-2c" {
                a3Text = pow((10.5/2), 2) * Float.pi
            } else if cable32.text == "2sq-3c" {
                a3Text = pow((11.5/2), 2) * Float.pi
            } else if cable32.text == "2sq-4c" {
                a3Text = pow((12.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-5c" {
                a3Text = pow((13.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-6c" {
                a3Text = pow((14.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-7c" {
                a3Text = pow((14.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-8c" {
                a3Text = pow((15.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-10c" {
                a3Text = pow((17.5/2), 2) * Float.pi
            } else if cable32.text == "2sq-12c" {
                a3Text = pow((18.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-15c" {
                a3Text = pow((19.5/2), 2) * Float.pi
            } else if cable32.text == "2sq-20c" {
                a3Text = pow((22.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-30c" {
                a3Text = pow((26.0/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-2c" {
                a3Text = pow((12.0/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-3c" {
                a3Text = pow((12.5/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-4c" {
                a3Text = pow((13.5/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-5c" {
                a3Text = pow((14.5/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-6c" {
                a3Text = pow((16.0/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-7c" {
                a3Text = pow((16.0/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-8c" {
                a3Text = pow((17.0/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-10c" {
                a3Text = pow((20/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-12c" {
                a3Text = pow((21/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-15c" {
                a3Text = pow((22/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-20c" {
                a3Text = pow((25/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-30c" {
                a3Text = pow((30/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-2c" {
                a3Text = pow((14.0/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-3c" {
                a3Text = pow((14.5/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-4c" {
                a3Text = pow((16.0/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-5c" {
                a3Text = pow((17.5/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-6c" {
                a3Text = pow((19.0/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-7c" {
                a3Text = pow((19.0/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-8c" {
                a3Text = pow((21/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-10c" {
                a3Text = pow((24/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-12c" {
                a3Text = pow((25/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-15c" {
                a3Text = pow((27/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-20c" {
                a3Text = pow((31/2), 2) * Float.pi
            }
        } else if cable31.text == "CV" {
            if cable32.text == "2sq-2c" {
                a3Text = pow((10.5/2), 2) * Float.pi
            } else if cable32.text == "2sq-3c" {
                a3Text = pow((11.0/2), 2) * Float.pi
            } else if cable32.text == "2sq-4c" {
                a3Text = pow((12.0/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-2c" {
                a3Text = pow((11.5/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-3c" {
                a3Text = pow((12.5/2), 2) * Float.pi
            } else if cable32.text == "3.5sq-4c" {
                a3Text = pow((13.5/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-2c" {
                a3Text = pow((13.5/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-3c" {
                a3Text = pow((14.5/2), 2) * Float.pi
            } else if cable32.text == "5.5sq-4c" {
                a3Text = pow((16.0/2), 2) * Float.pi
            } else if cable32.text == "8sq-2c" {
                a3Text = pow((15.0/2), 2) * Float.pi
            } else if cable32.text == "8sq-3c" {
                a3Text = pow((16.0/2), 2) * Float.pi
            } else if cable32.text == "8sq-4c" {
                a3Text = pow((17.0/2), 2) * Float.pi
            } else if cable32.text == "14sq-2c" {
                a3Text = pow((16.5/2), 2) * Float.pi
            } else if cable32.text == "14sq-3c" {
                a3Text = pow((17.5/2), 2) * Float.pi
            } else if cable32.text == "14sq-4c" {
                a3Text = pow((19.0/2), 2) * Float.pi
            } else if cable32.text == "22sq-2c" {
                a3Text = pow((19.5/2), 2) * Float.pi
            } else if cable32.text == "22sq-3c" {
                a3Text = pow((21.0/2), 2) * Float.pi
            } else if cable32.text == "22sq-4c" {
                a3Text = pow((23.0/2), 2) * Float.pi
            } else if cable32.text == "38sq-2c" {
                a3Text = pow((24.0/2), 2) * Float.pi
            } else if cable32.text == "38sq-3c" {
                a3Text = pow((25.0/2), 2) * Float.pi
            } else if cable32.text == "38sq-4c" {
                a3Text = pow((28.0/2), 2) * Float.pi
            } else if cable32.text == "60sq-2c" {
                a3Text = pow((29.0/2), 2) * Float.pi
            } else if cable32.text == "60sq-3c" {
                a3Text = pow((31.0/2), 2) * Float.pi
            } else if cable32.text == "60sq-4c" {
                a3Text = pow((35.0/2), 2) * Float.pi
            } else if cable32.text == "100sq-2c" {
                a3Text = pow((37.0/2), 2) * Float.pi
            } else if cable32.text == "100sq-3c" {
                a3Text = pow((40.0/2), 2) * Float.pi
            } else if cable32.text == "100sq-4c" {
                a3Text = pow((44.0/2), 2) * Float.pi
            } else if cable32.text == "150sq-2c" {
                a3Text = pow((43.0/2), 2) * Float.pi
            } else if cable32.text == "150sq-3c" {
                a3Text = pow((46.0/2), 2) * Float.pi
            } else if cable32.text == "150sq-4c" {
                a3Text = pow((51.0/2), 2) * Float.pi
            } else if cable32.text == "200sq-2c" {
                a3Text = pow((50.0/2), 2) * Float.pi
            } else if cable32.text == "200sq-3c" {
                a3Text = pow((54.0/2), 2) * Float.pi
            } else if cable32.text == "200sq-4c" {
                a3Text = pow((60.0/2), 2) * Float.pi
            } else if cable32.text == "250sq-2c" {
                a3Text = pow((54.0/2), 2) * Float.pi
            } else if cable32.text == "250sq-3c" {
                a3Text = pow((58.0/2), 2) * Float.pi
            } else if cable32.text == "250sq-4c" {
                a3Text = pow((65.0/2), 2) * Float.pi
            } else if cable32.text == "325sq-2c" {
                a3Text = pow((60.0/2), 2) * Float.pi
            } else if cable32.text == "325sq-3c" {
                a3Text = pow((65.0/2), 2) * Float.pi
            } else if cable32.text == "325sq-4c" {
                a3Text = pow((72.0/2), 2) * Float.pi
            }
        } else if cable31.text == "CVD" {
            if cable32.text == "14sq" {
                a3Text = pow((19/2), 2) * Float.pi
            } else if cable32.text == "22sq" {
                a3Text = pow((22/2), 2) * Float.pi
            } else if cable32.text == "38sq" {
                a3Text = pow((25/2), 2) * Float.pi
            } else if cable32.text == "60sq" {
                a3Text = pow((31/2), 2) * Float.pi
            } else if cable32.text == "100sq" {
                a3Text = pow((38/2), 2) * Float.pi
            } else if cable32.text == "150sq" {
                a3Text = pow((44/2), 2) * Float.pi
            } else if cable32.text == "200sq" {
                a3Text = pow((51/2), 2) * Float.pi
            } else if cable32.text == "250sq" {
                a3Text = pow((55/2), 2) * Float.pi
            } else if cable32.text == "325sq" {
                a3Text = pow((61/2), 2) * Float.pi
            }
        } else if cable31.text == "CVT" {
            if cable32.text == "14sq" {
                a3Text = pow((21/2), 2) * Float.pi
            } else if cable32.text == "22sq" {
                a3Text = pow((24/2), 2) * Float.pi
            } else if cable32.text == "38sq" {
                a3Text = pow((28/2), 2) * Float.pi
            } else if cable32.text == "60sq" {
                a3Text = pow((33/2), 2) * Float.pi
            } else if cable32.text == "100sq" {
                a3Text = pow((41/2), 2) * Float.pi
            } else if cable32.text == "150sq" {
                a3Text = pow((47/2), 2) * Float.pi
            } else if cable32.text == "200sq" {
                a3Text = pow((55/2), 2) * Float.pi
            } else if cable32.text == "250sq" {
                a3Text = pow((60/2), 2) * Float.pi
            } else if cable32.text == "325sq" {
                a3Text = pow((66/2), 2) * Float.pi
            }
        } else if cable31.text == "CVQ" {
            if cable32.text == "14sq" {
                a3Text = pow((23/2), 2) * Float.pi
            } else if cable32.text == "22sq" {
                a3Text = pow((27/2), 2) * Float.pi
            } else if cable32.text == "38sq" {
                a3Text = pow((31/2), 2) * Float.pi
            } else if cable32.text == "60sq" {
                a3Text = pow((37/2), 2) * Float.pi
            } else if cable32.text == "100sq" {
                a3Text = pow((46/2), 2) * Float.pi
            } else if cable32.text == "150sq" {
                a3Text = pow((53/2), 2) * Float.pi
            } else if cable32.text == "200sq" {
                a3Text = pow((61/2), 2) * Float.pi
            } else if cable32.text == "250sq" {
                a3Text = pow((67/2), 2) * Float.pi
            } else if cable32.text == "325sq" {
                a3Text = pow((74/2), 2) * Float.pi
            }
        } else if cable31.text == "IV" {
            if cable32.text == "1.25sq" {
                a3Text = pow((3.0/2), 2) * Float.pi
            } else if cable32.text == "2sq" {
                a3Text = pow((3.4/2), 2) * Float.pi
            } else if cable32.text == "3.5sq" {
                a3Text = pow((4.0/2), 2) * Float.pi
            } else if cable32.text == "5.5sq" {
                a3Text = pow((5.0/2), 2) * Float.pi
            } else if cable32.text == "8sq" {
                a3Text = pow((6.0/2), 2) * Float.pi
            } else if cable32.text == "14sq" {
                a3Text = pow((7.6/2), 2) * Float.pi
            } else if cable32.text == "22sq" {
                a3Text = pow((9.2/2), 2) * Float.pi
            } else if cable32.text == "38sq" {
                a3Text = pow((11.5/2), 2) * Float.pi
            } else if cable32.text == "60sq" {
                a3Text = pow((14.0/2), 2) * Float.pi
            } else if cable32.text == "100sq" {
                a3Text = pow((17.0/2), 2) * Float.pi
            } else if cable32.text == "150sq" {
                a3Text = pow((21/2), 2) * Float.pi
            } else if cable32.text == "200sq" {
                a3Text = pow((23/2), 2) * Float.pi
            } else if cable32.text == "250sq" {
                a3Text = pow((26/2), 2) * Float.pi
            } else if cable32.text == "325sq" {
                a3Text = pow((29/2), 2) * Float.pi
            }
        }
        
        if cable41.text == "CVV" {
            if cable42.text == "1.25sq-2c" {
                a4Text = pow((9.1/2),2) * Float.pi
            } else if cable42.text == "1.25sq-3c" {
                a4Text = pow((9.6/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-4c" {
                a4Text = pow((10.5/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-5c" {
                a4Text = pow((11.5/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-6c" {
                a4Text = pow((12.0/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-7c" {
                a4Text = pow((12.0/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-8c" {
                a4Text = pow((13.0/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-10c" {
                a4Text = pow((15.0/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-12c" {
                a4Text = pow((15.5/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-15c" {
                a4Text = pow((17.0/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-20c" {
                a4Text = pow((18.5/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-30c" {
                a4Text = pow((23.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-2c" {
                a4Text = pow((10.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-3c" {
                a4Text = pow((11.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-4c" {
                a4Text = pow((11.5/2), 2) * Float.pi
            } else if cable42.text == "2sq-5c" {
                a4Text = pow((12.5/2), 2) * Float.pi
            } else if cable42.text == "2sq-6c" {
                a4Text = pow((13.5/2), 2) * Float.pi
            } else if cable42.text == "2sq-7c" {
                a4Text = pow((13.5/2), 2) * Float.pi
            } else if cable42.text == "2sq-8c" {
                a4Text = pow((14.5/2), 2) * Float.pi
            } else if cable42.text == "2sq-10c" {
                a4Text = pow((17.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-12c" {
                a4Text = pow((17.5/2), 2) * Float.pi
            } else if cable42.text == "2sq-15c" {
                a4Text = pow((19.5/2), 2) * Float.pi
            } else if cable42.text == "2sq-20c" {
                a4Text = pow((21.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-30c" {
                a4Text = pow((26.0/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-2c" {
                a4Text = pow((11.5/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-3c" {
                a4Text = pow((12.0/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-4c" {
                a4Text = pow((13.0/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-5c" {
                a4Text = pow((14.0/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-6c" {
                a4Text = pow((15.5/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-7c" {
                a4Text = pow((15.5/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-8c" {
                a4Text = pow((16.5/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-10c" {
                a4Text = pow((19.5/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-12c" {
                a4Text = pow((20/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-15c" {
                a4Text = pow((22/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-20c" {
                a4Text = pow((24/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-30c" {
                a4Text = pow((30/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-2c" {
                a4Text = pow((13.5/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-3c" {
                a4Text = pow((14.0/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-4c" {
                a4Text = pow((15.5/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-5c" {
                a4Text = pow((17.0/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-6c" {
                a4Text = pow((18.5/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-7c" {
                a4Text = pow((18.5/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-8c" {
                a4Text = pow((20/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-10c" {
                a4Text = pow((24/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-12c" {
                a4Text = pow((25/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-15c" {
                a4Text = pow((27/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-20c" {
                a4Text = pow((30/2), 2) * Float.pi
            }
        } else if cable41.text == "CVVS" {
            if cable42.text == "1.25sq-2c" {
                a4Text = pow((9.6/2),2) * Float.pi
            } else if cable42.text == "1.25sq-3c" {
                a4Text = pow((10.5/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-4c" {
                a4Text = pow((11.0/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-5c" {
                a4Text = pow((12.0/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-6c" {
                a4Text = pow((13.0/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-7c" {
                a4Text = pow((13.0/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-8c" {
                a4Text = pow((13.5/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-10c" {
                a4Text = pow((15.5/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-12c" {
                a4Text = pow((16.0/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-15c" {
                a4Text = pow((17.0/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-20c" {
                a4Text = pow((19.0/2), 2) * Float.pi
            } else if cable42.text == "1.25sq-30c" {
                a4Text = pow((23.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-2c" {
                a4Text = pow((10.5/2), 2) * Float.pi
            } else if cable42.text == "2sq-3c" {
                a4Text = pow((11.5/2), 2) * Float.pi
            } else if cable42.text == "2sq-4c" {
                a4Text = pow((12.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-5c" {
                a4Text = pow((13.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-6c" {
                a4Text = pow((14.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-7c" {
                a4Text = pow((14.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-8c" {
                a4Text = pow((15.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-10c" {
                a4Text = pow((17.5/2), 2) * Float.pi
            } else if cable42.text == "2sq-12c" {
                a4Text = pow((18.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-15c" {
                a4Text = pow((19.5/2), 2) * Float.pi
            } else if cable42.text == "2sq-20c" {
                a4Text = pow((22.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-30c" {
                a4Text = pow((26.0/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-2c" {
                a4Text = pow((12.0/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-3c" {
                a4Text = pow((12.5/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-4c" {
                a4Text = pow((13.5/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-5c" {
                a4Text = pow((14.5/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-6c" {
                a4Text = pow((16.0/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-7c" {
                a4Text = pow((16.0/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-8c" {
                a4Text = pow((17.0/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-10c" {
                a4Text = pow((20/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-12c" {
                a4Text = pow((21/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-15c" {
                a4Text = pow((22/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-20c" {
                a4Text = pow((25/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-30c" {
                a4Text = pow((30/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-2c" {
                a4Text = pow((14.0/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-3c" {
                a4Text = pow((14.5/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-4c" {
                a4Text = pow((16.0/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-5c" {
                a4Text = pow((17.5/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-6c" {
                a4Text = pow((19.0/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-7c" {
                a4Text = pow((19.0/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-8c" {
                a4Text = pow((21/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-10c" {
                a4Text = pow((24/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-12c" {
                a4Text = pow((25/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-15c" {
                a4Text = pow((27/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-20c" {
                a4Text = pow((31/2), 2) * Float.pi
            }
        } else if cable41.text == "CV" {
            if cable42.text == "2sq-2c" {
                a4Text = pow((10.5/2), 2) * Float.pi
            } else if cable42.text == "2sq-3c" {
                a4Text = pow((11.0/2), 2) * Float.pi
            } else if cable42.text == "2sq-4c" {
                a4Text = pow((12.0/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-2c" {
                a4Text = pow((11.5/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-3c" {
                a4Text = pow((12.5/2), 2) * Float.pi
            } else if cable42.text == "3.5sq-4c" {
                a4Text = pow((13.5/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-2c" {
                a4Text = pow((13.5/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-3c" {
                a4Text = pow((14.5/2), 2) * Float.pi
            } else if cable42.text == "5.5sq-4c" {
                a4Text = pow((16.0/2), 2) * Float.pi
            } else if cable42.text == "8sq-2c" {
                a4Text = pow((15.0/2), 2) * Float.pi
            } else if cable42.text == "8sq-3c" {
                a4Text = pow((16.0/2), 2) * Float.pi
            } else if cable42.text == "8sq-4c" {
                a4Text = pow((17.0/2), 2) * Float.pi
            } else if cable42.text == "14sq-2c" {
                a4Text = pow((16.5/2), 2) * Float.pi
            } else if cable42.text == "14sq-3c" {
                a4Text = pow((17.5/2), 2) * Float.pi
            } else if cable42.text == "14sq-4c" {
                a4Text = pow((19.0/2), 2) * Float.pi
            } else if cable42.text == "22sq-2c" {
                a4Text = pow((19.5/2), 2) * Float.pi
            } else if cable42.text == "22sq-3c" {
                a4Text = pow((21.0/2), 2) * Float.pi
            } else if cable42.text == "22sq-4c" {
                a4Text = pow((23.0/2), 2) * Float.pi
            } else if cable42.text == "38sq-2c" {
                a4Text = pow((24.0/2), 2) * Float.pi
            } else if cable42.text == "38sq-3c" {
                a4Text = pow((25.0/2), 2) * Float.pi
            } else if cable42.text == "38sq-4c" {
                a4Text = pow((28.0/2), 2) * Float.pi
            } else if cable42.text == "60sq-2c" {
                a4Text = pow((29.0/2), 2) * Float.pi
            } else if cable42.text == "60sq-3c" {
                a4Text = pow((31.0/2), 2) * Float.pi
            } else if cable42.text == "60sq-4c" {
                a4Text = pow((35.0/2), 2) * Float.pi
            } else if cable42.text == "100sq-2c" {
                a4Text = pow((37.0/2), 2) * Float.pi
            } else if cable42.text == "100sq-3c" {
                a4Text = pow((40.0/2), 2) * Float.pi
            } else if cable42.text == "100sq-4c" {
                a4Text = pow((44.0/2), 2) * Float.pi
            } else if cable42.text == "150sq-2c" {
                a4Text = pow((43.0/2), 2) * Float.pi
            } else if cable42.text == "150sq-3c" {
                a4Text = pow((46.0/2), 2) * Float.pi
            } else if cable42.text == "150sq-4c" {
                a4Text = pow((51.0/2), 2) * Float.pi
            } else if cable42.text == "200sq-2c" {
                a4Text = pow((50.0/2), 2) * Float.pi
            } else if cable42.text == "200sq-3c" {
                a4Text = pow((54.0/2), 2) * Float.pi
            } else if cable42.text == "200sq-4c" {
                a4Text = pow((60.0/2), 2) * Float.pi
            } else if cable42.text == "250sq-2c" {
                a4Text = pow((54.0/2), 2) * Float.pi
            } else if cable42.text == "250sq-3c" {
                a4Text = pow((58.0/2), 2) * Float.pi
            } else if cable42.text == "250sq-4c" {
                a4Text = pow((65.0/2), 2) * Float.pi
            } else if cable42.text == "325sq-2c" {
                a4Text = pow((60.0/2), 2) * Float.pi
            } else if cable42.text == "325sq-3c" {
                a4Text = pow((65.0/2), 2) * Float.pi
            } else if cable42.text == "325sq-4c" {
                a4Text = pow((72.0/2), 2) * Float.pi
            }
        } else if cable41.text == "CVD" {
            if cable42.text == "14sq" {
                a4Text = pow((19/2), 2) * Float.pi
            } else if cable42.text == "22sq" {
                a4Text = pow((22/2), 2) * Float.pi
            } else if cable42.text == "38sq" {
                a4Text = pow((25/2), 2) * Float.pi
            } else if cable42.text == "60sq" {
                a4Text = pow((31/2), 2) * Float.pi
            } else if cable42.text == "100sq" {
                a4Text = pow((38/2), 2) * Float.pi
            } else if cable42.text == "150sq" {
                a4Text = pow((44/2), 2) * Float.pi
            } else if cable42.text == "200sq" {
                a4Text = pow((51/2), 2) * Float.pi
            } else if cable42.text == "250sq" {
                a4Text = pow((55/2), 2) * Float.pi
            } else if cable42.text == "325sq" {
                a4Text = pow((61/2), 2) * Float.pi
            }
        } else if cable41.text == "CVT" {
            if cable42.text == "14sq" {
                a4Text = pow((21/2), 2) * Float.pi
            } else if cable42.text == "22sq" {
                a4Text = pow((24/2), 2) * Float.pi
            } else if cable42.text == "38sq" {
                a4Text = pow((28/2), 2) * Float.pi
            } else if cable42.text == "60sq" {
                a4Text = pow((33/2), 2) * Float.pi
            } else if cable42.text == "100sq" {
                a4Text = pow((41/2), 2) * Float.pi
            } else if cable42.text == "150sq" {
                a4Text = pow((47/2), 2) * Float.pi
            } else if cable42.text == "200sq" {
                a4Text = pow((55/2), 2) * Float.pi
            } else if cable42.text == "250sq" {
                a4Text = pow((60/2), 2) * Float.pi
            } else if cable42.text == "325sq" {
                a4Text = pow((66/2), 2) * Float.pi
            }
        } else if cable41.text == "CVQ" {
            if cable42.text == "14sq" {
                a4Text = pow((23/2), 2) * Float.pi
            } else if cable42.text == "22sq" {
                a4Text = pow((27/2), 2) * Float.pi
            } else if cable42.text == "38sq" {
                a4Text = pow((31/2), 2) * Float.pi
            } else if cable42.text == "60sq" {
                a4Text = pow((37/2), 2) * Float.pi
            } else if cable42.text == "100sq" {
                a4Text = pow((46/2), 2) * Float.pi
            } else if cable42.text == "150sq" {
                a4Text = pow((53/2), 2) * Float.pi
            } else if cable42.text == "200sq" {
                a4Text = pow((61/2), 2) * Float.pi
            } else if cable42.text == "250sq" {
                a4Text = pow((67/2), 2) * Float.pi
            } else if cable42.text == "325sq" {
                a4Text = pow((74/2), 2) * Float.pi
            }
        } else if cable41.text == "IV" {
            if cable42.text == "1.25sq" {
                a4Text = pow((3.0/2), 2) * Float.pi
            } else if cable42.text == "2sq" {
                a4Text = pow((3.4/2), 2) * Float.pi
            } else if cable42.text == "3.5sq" {
                a4Text = pow((4.0/2), 2) * Float.pi
            } else if cable42.text == "5.5sq" {
                a4Text = pow((5.0/2), 2) * Float.pi
            } else if cable42.text == "8sq" {
                a4Text = pow((6.0/2), 2) * Float.pi
            } else if cable42.text == "14sq" {
                a4Text = pow((7.6/2), 2) * Float.pi
            } else if cable42.text == "22sq" {
                a4Text = pow((9.2/2), 2) * Float.pi
            } else if cable42.text == "38sq" {
                a4Text = pow((11.5/2), 2) * Float.pi
            } else if cable42.text == "60sq" {
                a4Text = pow((14.0/2), 2) * Float.pi
            } else if cable42.text == "100sq" {
                a4Text = pow((17.0/2), 2) * Float.pi
            } else if cable42.text == "150sq" {
                a4Text = pow((21/2), 2) * Float.pi
            } else if cable42.text == "200sq" {
                a4Text = pow((23/2), 2) * Float.pi
            } else if cable42.text == "250sq" {
                a4Text = pow((26/2), 2) * Float.pi
            } else if cable42.text == "325sq" {
                a4Text = pow((29/2), 2) * Float.pi
            }
        }
        
        if cable51.text == "CVV" {
            if cable52.text == "1.25sq-2c" {
                a5Text = pow((9.1/2),2) * Float.pi
            } else if cable52.text == "1.25sq-3c" {
                a5Text = pow((9.6/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-4c" {
                a5Text = pow((10.5/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-5c" {
                a5Text = pow((11.5/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-6c" {
                a5Text = pow((12.0/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-7c" {
                a5Text = pow((12.0/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-8c" {
                a5Text = pow((13.0/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-10c" {
                a5Text = pow((15.0/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-12c" {
                a5Text = pow((15.5/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-15c" {
                a5Text = pow((17.0/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-20c" {
                a5Text = pow((18.5/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-30c" {
                a5Text = pow((23.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-2c" {
                a5Text = pow((10.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-3c" {
                a5Text = pow((11.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-4c" {
                a5Text = pow((11.5/2), 2) * Float.pi
            } else if cable52.text == "2sq-5c" {
                a5Text = pow((12.5/2), 2) * Float.pi
            } else if cable52.text == "2sq-6c" {
                a5Text = pow((13.5/2), 2) * Float.pi
            } else if cable52.text == "2sq-7c" {
                a5Text = pow((13.5/2), 2) * Float.pi
            } else if cable52.text == "2sq-8c" {
                a5Text = pow((14.5/2), 2) * Float.pi
            } else if cable52.text == "2sq-10c" {
                a5Text = pow((17.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-12c" {
                a5Text = pow((17.5/2), 2) * Float.pi
            } else if cable52.text == "2sq-15c" {
                a5Text = pow((19.5/2), 2) * Float.pi
            } else if cable52.text == "2sq-20c" {
                a5Text = pow((21.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-30c" {
                a5Text = pow((26.0/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-2c" {
                a5Text = pow((11.5/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-3c" {
                a5Text = pow((12.0/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-4c" {
                a5Text = pow((13.0/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-5c" {
                a5Text = pow((14.0/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-6c" {
                a5Text = pow((15.5/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-7c" {
                a5Text = pow((15.5/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-8c" {
                a5Text = pow((16.5/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-10c" {
                a5Text = pow((19.5/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-12c" {
                a5Text = pow((20/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-15c" {
                a5Text = pow((22/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-20c" {
                a5Text = pow((24/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-30c" {
                a5Text = pow((30/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-2c" {
                a5Text = pow((13.5/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-3c" {
                a5Text = pow((14.0/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-4c" {
                a5Text = pow((15.5/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-5c" {
                a5Text = pow((17.0/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-6c" {
                a5Text = pow((18.5/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-7c" {
                a5Text = pow((18.5/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-8c" {
                a5Text = pow((20/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-10c" {
                a5Text = pow((24/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-12c" {
                a5Text = pow((25/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-15c" {
                a5Text = pow((27/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-20c" {
                a5Text = pow((30/2), 2) * Float.pi
            }
        } else if cable51.text == "CVVS" {
            if cable52.text == "1.25sq-2c" {
                a5Text = pow((9.6/2),2) * Float.pi
            } else if cable52.text == "1.25sq-3c" {
                a5Text = pow((10.5/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-4c" {
                a5Text = pow((11.0/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-5c" {
                a5Text = pow((12.0/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-6c" {
                a5Text = pow((13.0/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-7c" {
                a5Text = pow((13.0/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-8c" {
                a5Text = pow((13.5/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-10c" {
                a5Text = pow((15.5/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-12c" {
                a5Text = pow((16.0/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-15c" {
                a5Text = pow((17.0/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-20c" {
                a5Text = pow((19.0/2), 2) * Float.pi
            } else if cable52.text == "1.25sq-30c" {
                a5Text = pow((23.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-2c" {
                a5Text = pow((10.5/2), 2) * Float.pi
            } else if cable52.text == "2sq-3c" {
                a5Text = pow((11.5/2), 2) * Float.pi
            } else if cable52.text == "2sq-4c" {
                a5Text = pow((12.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-5c" {
                a5Text = pow((13.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-6c" {
                a5Text = pow((14.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-7c" {
                a5Text = pow((14.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-8c" {
                a5Text = pow((15.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-10c" {
                a5Text = pow((17.5/2), 2) * Float.pi
            } else if cable52.text == "2sq-12c" {
                a5Text = pow((18.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-15c" {
                a5Text = pow((19.5/2), 2) * Float.pi
            } else if cable52.text == "2sq-20c" {
                a5Text = pow((22.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-30c" {
                a5Text = pow((26.0/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-2c" {
                a5Text = pow((12.0/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-3c" {
                a5Text = pow((12.5/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-4c" {
                a5Text = pow((13.5/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-5c" {
                a5Text = pow((14.5/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-6c" {
                a5Text = pow((16.0/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-7c" {
                a5Text = pow((16.0/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-8c" {
                a5Text = pow((17.0/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-10c" {
                a5Text = pow((20/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-12c" {
                a5Text = pow((21/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-15c" {
                a5Text = pow((22/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-20c" {
                a5Text = pow((25/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-30c" {
                a5Text = pow((30/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-2c" {
                a5Text = pow((14.0/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-3c" {
                a5Text = pow((14.5/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-4c" {
                a5Text = pow((16.0/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-5c" {
                a5Text = pow((17.5/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-6c" {
                a5Text = pow((19.0/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-7c" {
                a5Text = pow((19.0/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-8c" {
                a5Text = pow((21/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-10c" {
                a5Text = pow((24/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-12c" {
                a5Text = pow((25/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-15c" {
                a5Text = pow((27/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-20c" {
                a5Text = pow((31/2), 2) * Float.pi
            }
        } else if cable51.text == "CV" {
            if cable52.text == "2sq-2c" {
                a5Text = pow((10.5/2), 2) * Float.pi
            } else if cable52.text == "2sq-3c" {
                a5Text = pow((11.0/2), 2) * Float.pi
            } else if cable52.text == "2sq-4c" {
                a5Text = pow((12.0/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-2c" {
                a5Text = pow((11.5/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-3c" {
                a5Text = pow((12.5/2), 2) * Float.pi
            } else if cable52.text == "3.5sq-4c" {
                a5Text = pow((13.5/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-2c" {
                a5Text = pow((13.5/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-3c" {
                a5Text = pow((14.5/2), 2) * Float.pi
            } else if cable52.text == "5.5sq-4c" {
                a5Text = pow((16.0/2), 2) * Float.pi
            } else if cable52.text == "8sq-2c" {
                a5Text = pow((15.0/2), 2) * Float.pi
            } else if cable52.text == "8sq-3c" {
                a5Text = pow((16.0/2), 2) * Float.pi
            } else if cable52.text == "8sq-4c" {
                a5Text = pow((17.0/2), 2) * Float.pi
            } else if cable52.text == "14sq-2c" {
                a5Text = pow((16.5/2), 2) * Float.pi
            } else if cable52.text == "14sq-3c" {
                a5Text = pow((17.5/2), 2) * Float.pi
            } else if cable52.text == "14sq-4c" {
                a5Text = pow((19.0/2), 2) * Float.pi
            } else if cable52.text == "22sq-2c" {
                a5Text = pow((19.5/2), 2) * Float.pi
            } else if cable52.text == "22sq-3c" {
                a5Text = pow((21.0/2), 2) * Float.pi
            } else if cable52.text == "22sq-4c" {
                a5Text = pow((23.0/2), 2) * Float.pi
            } else if cable52.text == "38sq-2c" {
                a5Text = pow((24.0/2), 2) * Float.pi
            } else if cable52.text == "38sq-3c" {
                a5Text = pow((25.0/2), 2) * Float.pi
            } else if cable52.text == "38sq-4c" {
                a5Text = pow((28.0/2), 2) * Float.pi
            } else if cable52.text == "60sq-2c" {
                a5Text = pow((29.0/2), 2) * Float.pi
            } else if cable52.text == "60sq-3c" {
                a5Text = pow((31.0/2), 2) * Float.pi
            } else if cable52.text == "60sq-4c" {
                a5Text = pow((35.0/2), 2) * Float.pi
            } else if cable52.text == "100sq-2c" {
                a5Text = pow((37.0/2), 2) * Float.pi
            } else if cable52.text == "100sq-3c" {
                a5Text = pow((40.0/2), 2) * Float.pi
            } else if cable52.text == "100sq-4c" {
                a5Text = pow((44.0/2), 2) * Float.pi
            } else if cable52.text == "150sq-2c" {
                a5Text = pow((43.0/2), 2) * Float.pi
            } else if cable52.text == "150sq-3c" {
                a5Text = pow((46.0/2), 2) * Float.pi
            } else if cable52.text == "150sq-4c" {
                a5Text = pow((51.0/2), 2) * Float.pi
            } else if cable52.text == "200sq-2c" {
                a5Text = pow((50.0/2), 2) * Float.pi
            } else if cable52.text == "200sq-3c" {
                a5Text = pow((54.0/2), 2) * Float.pi
            } else if cable52.text == "200sq-4c" {
                a5Text = pow((60.0/2), 2) * Float.pi
            } else if cable52.text == "250sq-2c" {
                a5Text = pow((54.0/2), 2) * Float.pi
            } else if cable52.text == "250sq-3c" {
                a5Text = pow((58.0/2), 2) * Float.pi
            } else if cable52.text == "250sq-4c" {
                a5Text = pow((65.0/2), 2) * Float.pi
            } else if cable52.text == "325sq-2c" {
                a5Text = pow((60.0/2), 2) * Float.pi
            } else if cable52.text == "325sq-3c" {
                a5Text = pow((65.0/2), 2) * Float.pi
            } else if cable52.text == "325sq-4c" {
                a5Text = pow((72.0/2), 2) * Float.pi
            }
        } else if cable51.text == "CVD" {
            if cable52.text == "14sq" {
                a5Text = pow((19/2), 2) * Float.pi
            } else if cable52.text == "22sq" {
                a5Text = pow((22/2), 2) * Float.pi
            } else if cable52.text == "38sq" {
                a5Text = pow((25/2), 2) * Float.pi
            } else if cable52.text == "60sq" {
                a5Text = pow((31/2), 2) * Float.pi
            } else if cable52.text == "100sq" {
                a5Text = pow((38/2), 2) * Float.pi
            } else if cable52.text == "150sq" {
                a5Text = pow((44/2), 2) * Float.pi
            } else if cable52.text == "200sq" {
                a5Text = pow((51/2), 2) * Float.pi
            } else if cable52.text == "250sq" {
                a5Text = pow((55/2), 2) * Float.pi
            } else if cable52.text == "325sq" {
                a5Text = pow((61/2), 2) * Float.pi
            }
        } else if cable51.text == "CVT" {
            if cable52.text == "14sq" {
                a5Text = pow((21/2), 2) * Float.pi
            } else if cable52.text == "22sq" {
                a5Text = pow((24/2), 2) * Float.pi
            } else if cable52.text == "38sq" {
                a5Text = pow((28/2), 2) * Float.pi
            } else if cable52.text == "60sq" {
                a5Text = pow((33/2), 2) * Float.pi
            } else if cable52.text == "100sq" {
                a5Text = pow((41/2), 2) * Float.pi
            } else if cable52.text == "150sq" {
                a5Text = pow((47/2), 2) * Float.pi
            } else if cable52.text == "200sq" {
                a5Text = pow((55/2), 2) * Float.pi
            } else if cable52.text == "250sq" {
                a5Text = pow((60/2), 2) * Float.pi
            } else if cable52.text == "325sq" {
                a5Text = pow((66/2), 2) * Float.pi
            }
        } else if cable51.text == "CVQ" {
            if cable52.text == "14sq" {
                a5Text = pow((23/2), 2) * Float.pi
            } else if cable52.text == "22sq" {
                a5Text = pow((27/2), 2) * Float.pi
            } else if cable52.text == "38sq" {
                a5Text = pow((31/2), 2) * Float.pi
            } else if cable52.text == "60sq" {
                a5Text = pow((37/2), 2) * Float.pi
            } else if cable52.text == "100sq" {
                a5Text = pow((46/2), 2) * Float.pi
            } else if cable52.text == "150sq" {
                a5Text = pow((53/2), 2) * Float.pi
            } else if cable52.text == "200sq" {
                a5Text = pow((61/2), 2) * Float.pi
            } else if cable52.text == "250sq" {
                a5Text = pow((67/2), 2) * Float.pi
            } else if cable52.text == "325sq" {
                a5Text = pow((74/2), 2) * Float.pi
            }
        } else if cable51.text == "IV" {
            if cable52.text == "1.25sq" {
                a5Text = pow((3.0/2), 2) * Float.pi
            } else if cable52.text == "2sq" {
                a5Text = pow((3.4/2), 2) * Float.pi
            } else if cable52.text == "3.5sq" {
                a5Text = pow((4.0/2), 2) * Float.pi
            } else if cable52.text == "5.5sq" {
                a5Text = pow((5.0/2), 2) * Float.pi
            } else if cable52.text == "8sq" {
                a5Text = pow((6.0/2), 2) * Float.pi
            } else if cable52.text == "14sq" {
                a5Text = pow((7.6/2), 2) * Float.pi
            } else if cable52.text == "22sq" {
                a5Text = pow((9.2/2), 2) * Float.pi
            } else if cable52.text == "38sq" {
                a5Text = pow((11.5/2), 2) * Float.pi
            } else if cable52.text == "60sq" {
                a5Text = pow((14.0/2), 2) * Float.pi
            } else if cable52.text == "100sq" {
                a5Text = pow((17.0/2), 2) * Float.pi
            } else if cable52.text == "150sq" {
                a5Text = pow((21/2), 2) * Float.pi
            } else if cable52.text == "200sq" {
                a5Text = pow((23/2), 2) * Float.pi
            } else if cable52.text == "250sq" {
                a5Text = pow((26/2), 2) * Float.pi
            } else if cable52.text == "325sq" {
                a5Text = pow((29/2), 2) * Float.pi
            }
        }
        
        let area1Double = NSString(string: quantity1.text!).floatValue * a1Text
        let area2Double = NSString(string: quantity2.text!).floatValue * a2Text
        let area3Double = NSString(string: quantity3.text!).floatValue * a3Text
        let area4Double = NSString(string: quantity4.text!).floatValue * a4Text
        let area5Double = NSString(string: quantity5.text!).floatValue * a5Text
        
        area1.text = String(format:"%.1f",area1Double)
        area2.text = String(format:"%.1f",area2Double)
        area3.text = String(format:"%.1f",area3Double)
        area4.text = String(format:"%.1f",area4Double)
        area5.text = String(format:"%.1f",area5Double)
        
        let totalAreaDouble = area1Double + area2Double + area3Double + area4Double + area5Double
        totalArea.text = String(format:"%.1f", totalAreaDouble)
        
        if totalAreaDouble <= 101 {
            pipeSizeG1.text = String("G16")
            standardG1.text = "101以下"
        } else if totalAreaDouble > 101 && totalAreaDouble <= 180 {
            pipeSizeG1.text = String("G22")
            standardG1.text = "180以下"
        } else if totalAreaDouble > 180 && totalAreaDouble <= 301 {
            pipeSizeG1.text = String("G28")
            standardG1.text = "301以下"
        } else if totalAreaDouble > 301 && totalAreaDouble <= 513 {
            pipeSizeG1.text = String("G36")
            standardG1.text = "513以下"
        } else if totalAreaDouble > 513 && totalAreaDouble <= 690 {
            pipeSizeG1.text = String("G42")
            standardG1.text = "690以下"
        } else if totalAreaDouble > 690 && totalAreaDouble <= 1098 {
            pipeSizeG1.text = String("G54")
            standardG1.text = "1,098以下"
        } else if totalAreaDouble > 1098 && totalAreaDouble <= 1825 {
            pipeSizeG1.text = String("G70")
            standardG1.text = "1,825以下"
        } else if totalAreaDouble > 1825 && totalAreaDouble <= 2552 {
            pipeSizeG1.text = String("G82")
            standardG1.text = "2,552以下"
        } else if totalAreaDouble > 2552 && totalAreaDouble <= 3308 {
            pipeSizeG1.text = String("G92")
            standardG1.text = "3,308以下"
        } else if totalAreaDouble > 3308 && totalAreaDouble <= 4265 {
            pipeSizeG1.text = String("G104")
            standardG1.text = "4,265以下"
        } else {
            pipeSizeG1.text = String("なし")
            standardG1.text = "---"
        }
        
        if totalAreaDouble <= 67 {
            pipeSizeG2.text = String("G16")
            standardG2.text = "67以下"
        } else if totalAreaDouble > 67 && totalAreaDouble <= 120 {
            pipeSizeG2.text = String("G22")
            standardG2.text = "120以下"
        } else if totalAreaDouble > 120 && totalAreaDouble <= 201 {
            pipeSizeG2.text = String("G28")
            standardG2.text = "201以下"
        } else if totalAreaDouble > 201 && totalAreaDouble <= 342 {
            pipeSizeG2.text = String("G36")
            standardG2.text = "342以下"
        } else if totalAreaDouble > 342 && totalAreaDouble <= 460 {
            pipeSizeG2.text = String("G42")
            standardG2.text = "460以下"
        } else if totalAreaDouble > 460 && totalAreaDouble <= 732 {
            pipeSizeG2.text = String("G54")
            standardG2.text = "732以下"
        } else if totalAreaDouble > 732 && totalAreaDouble <= 1216 {
            pipeSizeG2.text = String("G70")
            standardG2.text = "1,216以下"
        } else if totalAreaDouble > 1216 && totalAreaDouble <= 1701 {
            pipeSizeG2.text = String("G82")
            standardG2.text = "1,701以下"
        } else if totalAreaDouble > 1701 && totalAreaDouble <= 2205 {
            pipeSizeG2.text = String("G92")
            standardG2.text = "2,205以下"
        } else if totalAreaDouble > 2205 && totalAreaDouble <= 2843 {
            pipeSizeG2.text = String("G104")
            standardG2.text = "2,843以下"
        } else {
            pipeSizeG2.text = String("なし")
            standardG2.text = "---"
        }
        
        if totalAreaDouble <= 105 {
            pipeSizeE1.text = String("E19")
            standardE1.text = "105以下"
        } else if totalAreaDouble > 105 && totalAreaDouble <= 199 {
            pipeSizeE1.text = String("E25")
            standardE1.text = "199以下"
        } else if totalAreaDouble > 199 && totalAreaDouble <= 316 {
            pipeSizeE1.text = String("E31")
            standardE1.text = "316以下"
        } else if totalAreaDouble > 316 && totalAreaDouble <= 469 {
            pipeSizeE1.text = String("E39")
            standardE1.text = "469以下"
        } else if totalAreaDouble > 469 && totalAreaDouble <= 868 {
            pipeSizeE1.text = String("E51")
            standardE1.text = "868以下"
        } else if totalAreaDouble > 868 && totalAreaDouble <= 1370 {
            pipeSizeE1.text = String("E63")
            standardE1.text = "1,370以下"
        } else if totalAreaDouble > 1370 && totalAreaDouble <= 1986 {
            pipeSizeE1.text = String("E75")
            standardE1.text = "1,986以下"
        } else {
            pipeSizeE1.text = String("なし")
            standardE1.text = "---"
        }
        
        if totalAreaDouble <= 70 {
            pipeSizeE2.text = String("E19")
            standardE2.text = "70以下"
        } else if totalAreaDouble > 70 && totalAreaDouble <= 132 {
            pipeSizeE2.text = String("E25")
            standardE2.text = "132以下"
        } else if totalAreaDouble > 132 && totalAreaDouble <= 211 {
            pipeSizeE2.text = String("E31")
            standardE2.text = "211以下"
        } else if totalAreaDouble > 211 && totalAreaDouble <= 313 {
            pipeSizeE2.text = String("E39")
            standardE2.text = "313以下"
        } else if totalAreaDouble > 313 && totalAreaDouble <= 578 {
            pipeSizeE2.text = String("E51")
            standardE2.text = "578以下"
        } else if totalAreaDouble > 578 && totalAreaDouble <= 913 {
            pipeSizeE2.text = String("E63")
            standardE2.text = "913以下"
        } else if totalAreaDouble > 913 && totalAreaDouble <= 1324 {
            pipeSizeE2.text = String("E75")
            standardE2.text = "1,324以下"
        } else {
            pipeSizeE2.text = String("なし")
            standardE2.text = "---"
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        cable11.text = ""
        cable21.text = ""
        cable31.text = ""
        cable41.text = ""
        cable51.text = ""
        cable12.text = ""
        cable22.text = ""
        cable32.text = ""
        cable42.text = ""
        cable52.text = ""
        quantity1.text = ""
        quantity2.text = ""
        quantity3.text = ""
        quantity4.text = ""
        quantity5.text = ""
        area1.text = "0"
        area2.text = "0"
        area3.text = "0"
        area4.text = "0"
        area5.text = "0"
        totalArea.text = "0"
        pipeSizeG1.text = "G --"
        pipeSizeG2.text = "G --"
        pipeSizeE1.text = "E --"
        pipeSizeE2.text = "E --"
        standardG1.text = "---"
        standardG2.text = "---"
        standardE1.text = "---"
        standardE2.text = "---"
        
    }
    
}
