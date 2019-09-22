//
//  Button+Animation.swift
//  Quizzler
//
//  Created by mini03 on 9/22/19.
//  Copyright © 2019 TeamLuna. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    func pulse(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 1
        pulse.toValue = 1.05
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
    }
}
