//
//  Label+Animation.swift
//  Quizzler
//
//  Created by mini03 on 9/22/19.
//  Copyright © 2019 TeamLuna. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func pulse(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 1
        pulse.toValue = 1.2
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        
        layer.add(pulse, forKey: nil)
    }
}
