//
//  AnimationController.swift
//  AnimationsTest
//
//  Created by Ildar Zalyalov on 30.06.16.
//  Copyright © 2016 com.flatstack. All rights reserved.
//

import Foundation
import UIKit

class AnimataionController: UIViewController {
    
    var circleCenter: CGPoint!
    var propertyAnimator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add a draggable view
        let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        circle.center = self.view.center
        circle.layer.cornerRadius = 50.0
        circle.backgroundColor = UIColor.green()
        
        // add pan gesture recognizer to
        circle.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.dragCircle)))
        
//        self.propertyAnimator = UIViewPropertyAnimator(duration: 3.0, curve: .easeInOut, animations: {
//           
//            circle.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
//            circle.backgroundColor = UIColor.red()
//            circle.transform = CGAffineTransform(a: 10, b: 15, c: 25, d: 30, tx: self.view.center.x, ty: self.view.center.y)
//            
//        })
        
        
//        let curveProvider = UICubicTimingParameters(controlPoint1: CGPoint(x: 0.2, y: -0.48), controlPoint2: CGPoint(x: 0.79, y: 1.41))
//        
        //self.propertyAnimator = UIViewPropertyAnimator(duration: 3.0, timingParameters: curveProvider)
      
       
        self.propertyAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .linear, animations: {
            circle.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
        })
        
      self.propertyAnimator.addAnimations({
            circle.backgroundColor = UIColor.blue()
            }, delayFactor: 1.0)
        
        self.view.addSubview(circle)
        
        
    }
    
    func dragCircle(gesture: UIPanGestureRecognizer) {
        let target = gesture.view!
        
        switch gesture.state {
        case .began, .ended:
            circleCenter = target.center
        case .changed:
            let translation = gesture.translation(in: self.view)
            target.center = CGPoint(x: circleCenter!.x + translation.x, y: circleCenter!.y + translation.y)
        default: break
        }
    }
   
    @IBAction func playPressed(_ sender: AnyObject) {
        self.propertyAnimator.startAnimation()
    }
    
    @IBAction func pausePressed(_ sender: AnyObject) {
          self.propertyAnimator.pauseAnimation()
    }
    @IBAction func refreshPressed(_ sender: AnyObject) {
        self.propertyAnimator.isReversed = true
    }
    
}

