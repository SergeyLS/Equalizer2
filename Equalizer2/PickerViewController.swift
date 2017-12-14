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
    
    @IBOutlet weak var collectionView1: UICollectionView!
    
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
        
        //collectionView
        collectionView1.delegate = self
        collectionView1.dataSource = self
        collectionView1.tag = 1
        
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//        collectionView1.setCollectionViewLayout(flowLayout, animated: false)
        
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//        flowLayout.minimumInteritemSpacing = 10
//        //flowLayout.minimumLineSpacing = 10
//        collectionView1.isPagingEnabled = true
//        collectionView1.setCollectionViewLayout(flowLayout, animated: false)

        //self.collectionView1.frame = view.frame.insetBy(dx: -20.0, dy: 0.0)

        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        let width = collectionView1.bounds.width
//        layout.itemSize = CGSize(width: width / 2, height: collectionView1.bounds.height)
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        layout.scrollDirection = .horizontal
//        collectionView1.collectionViewLayout = layout
      
        
        //let newSize: CGSize = CGSize(width: collectionView1.frame.size.width / 4, height: collectionView1.frame.size.height)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        //layout.itemSize = newSize
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 20
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        collectionView1.setCollectionViewLayout(layout, animated: false)
        collectionView1.isPagingEnabled = true
        collectionView1.alwaysBounceVertical = false
        collectionView1.frame = view.frame.insetBy(dx: -20.0, dy: 0.0)
        
        
        
        self.pickerView1.delegate = self
        self.pickerView1.dataSource = self
        
        self.pickerView1.font = UIFont.systemFont(ofSize: 40, weight: .light)
        self.pickerView1.highlightedFont = UIFont.systemFont(ofSize: 40, weight: .light)
        
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



//==============================================================
// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
//==============================================================

extension PickerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
     }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return array1.count
        } else {
            return array2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as! Cell1CollectionViewCell
        
        cell.nameUI.text = array1[indexPath.row]
        
        return cell
    }
    
    //MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
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




