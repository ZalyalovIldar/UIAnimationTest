//
//  Line.swift
//  AnimationsTest
//
//  Created by Ildar Zalyalov on 06.07.16.
//  Copyright © 2016 com.flatstack. All rights reserved.
//

import UIKit

class Line: NSObject {
    
    var startPoint: CGPoint!
    var endPoint: CGPoint!
    var strokeWidth: CGFloat!
    
    override convenience init() {
        
        self.init(startPoint:CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 0, y: 0))
    }
    
    init(startPoint: CGPoint!, endPoint: CGPoint!, strokeWidth: CGFloat! = 1.0) {
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.strokeWidth = strokeWidth
    }
    
    func drawInContext(context: CGContext!, withColor color: UIColor! = UIColor.black()) {
        context.moveTo(x: startPoint.x, y: startPoint.y)
        context.addLineTo(x: endPoint.x, y: endPoint.y)
        context.setStrokeColor(color.cgColor)
        context.setLineWidth(strokeWidth)
        context.strokePath()
    }
    
    func getLenght() -> CGFloat {
        return sqrt((endPoint.x - startPoint.x)*(endPoint.x - startPoint.x) + (endPoint.y - startPoint.y)*(endPoint.y - startPoint.y))
    }
    
}
