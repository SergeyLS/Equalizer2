//
//  PickerViewController.swift
//  Equalizer2
//
//  Created by Sergey Leskov on 12/13/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController {
    
    @IBOutlet weak var pickerTempoUI: UIPickerView!
    @IBOutlet weak var viewOnPickerUI: UIView!
    
    @IBOutlet weak var pickerView1: AKPickerView!
    
    
    var pickerArray: [String] = []
    var array1: [String] = []
    var array2: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pickerTempoUI.delegate = self
        pickerTempoUI.dataSource = self
        
        for ind  in 110...130 {
            pickerArray.append(String(ind))
            
        }
        
        for ind  in 1...10 {
            array1.append(String(ind))
        }
        
        for ind  in 20...30 {
            array2.append(String(ind))
        }
        
        
        pickerTempoUI.backgroundColor = UIColor.black
        viewOnPickerUI.layer.cornerRadius = viewOnPickerUI.layer.bounds.height / 2
        
        
        
        
        self.pickerView1.delegate = self
        self.pickerView1.dataSource = self
        
        self.pickerView1.font = UIFont.systemFont(ofSize: 40, weight: .light)
        self.pickerView1.highlightedFont = UIFont.systemFont(ofSize: 40, weight: .light)
        
        self.pickerView1.textColor = UIColor.cyan
        self.pickerView1.highlightedTextColor = UIColor.white
        
        self.pickerView1.pickerViewStyle = .wheel
        self.pickerView1.maskDisabled = false
        self.pickerView1.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //        var insets = self.collectionView1.contentInset
    //        let value = (self.view.frame.size.width - (self.collectionView1.collectionViewLayout as! UICollectionViewFlowLayout).itemSize.width) * 0.5
    //        insets.left = value
    //        insets.right = value
    //        self.collectionView1.contentInset = insets
    //        print("\(value)")
    //        self.collectionView1.decelerationRate = UIScrollViewDecelerationRateFast;
    //    }
    
    
    
    
}

extension PickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currentSelect = pickerArray[row]
        
        print(currentSelect)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont.systemFont(ofSize: 110, weight: .ultraLight)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = pickerArray[row]
        pickerLabel?.textColor = UIColor.cyan
        
        //pickerLabel?.backgroundColor = UIColor.gray
        
        return pickerLabel!
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 130
    }
    
    
}



extension PickerViewController: AKPickerViewDataSource, AKPickerViewDelegate {
    
    func numberOfItemsInPickerView(_ pickerView: AKPickerView) -> Int {
        return array1.count
    }
    
    func pickerView(_ pickerView: AKPickerView, titleForItem item: Int) -> String {
        return self.array1[item]
    }
    
    func pickerView(_ pickerView: AKPickerView, didSelectItem item: Int) {
        print(self.array1[item])
    }
    
    
}




