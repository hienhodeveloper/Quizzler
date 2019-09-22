//
//  ImageView+Fade.swift
//  Quizzler
//
//  Created by mini03 on 9/22/19.
//  Copyright © 2019 TeamLuna. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func fadeOut(){
        let fade = CASpringAnimation(keyPath: "opacity")
        fade.duration = 0.2
        fade.fromValue = 1
        fade.toValue = 0
        layer.add(fade, forKey: nil)
        layer.opacity = 0
    }
    func fadeIn(){
        layer.isHidden = false
        let fade = CASpringAnimation(keyPath: "opacity")
        fade.duration = 0.2
        fade.fromValue = 0
        fade.toValue = 1
        fade.isRemovedOnCompletion = false
        layer.add(fade, forKey: nil)
        layer.opacity = 1
    }
}
