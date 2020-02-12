//
//  MCButton.swift
//  MyChatApp
//
//  Created by Sebastian Mayorga on 2/11/20.
//  Copyright © 2020 Sebastian Mayorga. All rights reserved.
//

import UIKit

class MCButton: UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUp()
    }
    
    private func setUp(){
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 50),
            self.widthAnchor.constraint(equalToConstant: 280)
        ])
        self.styleButton()

    }
    private func styleButton(){
        self.setShadow()
        self.setTitleColor(.white, for: .normal)
        
        self.backgroundColor    = Colors.coolBlue
        self.titleLabel?.font   = UIFont(name:"AvenirNext-DemiBold", size: 18)
        self.titleLabel?.text = "su mama"

        self.layer.cornerRadius = 25
        self.layer.borderWidth  = 3.0
        self.layer.borderColor  = UIColor.darkGray.cgColor
        
    }
    
    private func setShadow() {
        self.layer.shadowColor   = UIColor.black.cgColor
        self.layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        self.layer.shadowRadius  = 8
        self.layer.shadowOpacity = 0.5
        self.clipsToBounds       = true
        self.layer.masksToBounds = false
    }
    
    func shakeAnimation(){
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration     = 0.1
        shake .repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: self.center.x - 8, y: self.center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: self.center.x + 8, y: self.center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        self.layer.add(shake, forKey: "position")
    }
}
