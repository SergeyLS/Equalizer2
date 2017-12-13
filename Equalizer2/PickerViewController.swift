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
    
    var pickerArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerTempoUI.delegate = self
        pickerTempoUI.dataSource = self

        for ind  in 110...130 {
            pickerArray.append(String(ind))
            
        }
        
        pickerTempoUI.backgroundColor = UIColor.black
        viewOnPickerUI.layer.cornerRadius = viewOnPickerUI.layer.bounds.height / 2
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
