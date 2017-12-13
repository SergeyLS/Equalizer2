//
//  ViewController.swift
//  Equalizer2
//
//  Created by Sergey Leskov on 12/12/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var slider1: VerticalSlider!
    @IBOutlet weak var slider2: VerticalSlider!
    @IBOutlet weak var slider3: VerticalSlider!
    @IBOutlet weak var slider4: VerticalSlider!
    @IBOutlet weak var slider5: VerticalSlider!
    @IBOutlet weak var slider6: VerticalSlider!
    @IBOutlet weak var slider7: VerticalSlider!
    
    let trackHeight: CGFloat = 29
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let image = UIImage(named: "endLine")!
        let size = CGSize(width: trackHeight , height:  trackHeight)

        slider1.thumbImage = image.scaleToSize(newSize: size)
        slider2.thumbImage = image.scaleToSize(newSize: size)
        slider3.thumbImage = image.scaleToSize(newSize: size)
        slider4.thumbImage = image.scaleToSize(newSize: size)
        slider5.thumbImage = image.scaleToSize(newSize: size)
        slider6.thumbImage = image.scaleToSize(newSize: size)
        slider7.thumbImage = image.scaleToSize(newSize: size)
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 }


extension UIImage {
    
    func scaleToSize(newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        return newImage
    }
}
