//
//  InternalSlider.swift
//  Equalizer2
//
//  Created by Sergey Leskov on 12/13/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import UIKit

class InternalSlider: UISlider {
    
    var increment: Float = 0
    
    var roundedValue: Float {
        get {
            return round(super.value, to: increment)
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.frame.size = self.intrinsicContentSize
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        addTarget(self, action: #selector(touchUp), for: .touchUpInside)
        addTarget(self, action: #selector(touchUp), for: .touchUpOutside)

        addTarget(self, action: #selector(touchDown), for: .touchDown)
      }
    
    @objc func touchUp() {
        setValue(round(super.value, to: increment), animated: true)
        sendActions(for: .valueChanged)
        
        minimumTrackTintColor = UIColor.white
    }

    @objc func touchDown() {

        minimumTrackTintColor = UIColor.blue
    }

}

fileprivate func round(_ value: Float, to increment: Float) -> Float {
    if increment == 0 {
        return value
    }
    return increment * Float(round(value / increment))
}

