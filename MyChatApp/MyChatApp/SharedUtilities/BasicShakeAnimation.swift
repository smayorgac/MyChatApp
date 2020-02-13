//
//  BasicAnimations.swift
//  MyChatApp
//
//  Created by Sebastian Mayorga on 2/12/20.
//  Copyright © 2020 Sebastian Mayorga. All rights reserved.
//
import UIKit

struct BasicShakeAnimation: CustomAnimation {
    let action: CABasicAnimation
    
    init(){
        self.action = CABasicAnimation(keyPath: "position")
        action.duration     = 0.1
        action .repeatCount = 2
        action.autoreverses = true
    }
    
    func animate(view: UIView) {
        let fromPoint = CGPoint(x: view.center.x - 8, y: view.center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: view.center.x + 8, y: view.center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        action.fromValue = fromValue
        action.toValue = toValue
        view.layer.add(action, forKey: "position")
    }
}
