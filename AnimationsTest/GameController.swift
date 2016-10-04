//
//  GameController.swift
//  AnimationsTest
//
//  Created by Ildar Zalyalov on 05.07.16.
//  Copyright © 2016 com.flatstack. All rights reserved.
//

import Foundation
import UIKit

class GameController: UIViewController  {
    @IBOutlet weak var imageView: UIImageView!
    var levels: [Level]?
    var animator: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = self.drawTreeWithSize(size: self.view.frame.size, numberOfLevels: 9)
        
    }
    
    func drawTreeWithSize(size: CGSize, numberOfLevels: Int, startLength: CGFloat = 150) -> UIImage {
        assert(numberOfLevels > 0, "Tree must have at least one level")
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        let startPoint = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height)
        let endPoint = CGPoint(x: startPoint.x, y: startPoint.y - startLength)
        let startLine = Line(startPoint: startPoint, endPoint: endPoint, strokeWidth: 8)
        startLine.drawInContext(context: context, withColor: UIColor.brown())
        
        levels = [Level(lines: [startLine])]
        
        for i in 1...numberOfLevels {
            var newLevel = Level()
            if let previousLevel: Level = levels?[i - 1] {
                for line in previousLevel.lines {
                    let branch = Branch(normalLine: line, angleBetweenLines: 50, percentageOfCompression: 35)
                    newLevel.addLines(lines: branch.getLines())
                }
                self.drawLinesInContext(context: context, lines: newLevel.lines)
                self.levels!.append(newLevel)
            }
            
        }
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}

extension UIViewController {
    func drawLinesInContext(context: CGContext!, lines: [Line], withColor color: UIColor = UIColor.brown()) {
        for line: Line in lines {
            line.drawInContext(context: context, withColor: color)
        }
    }
}

extension Int {
    func toBool() -> Bool {
        switch self {
        case 0:
            return false
        default:
            return true
        }
    }
}

struct Level {
    var lines = [Line]()
    
    init(lines: [Line]) {
        self.lines = lines
    }
    
    init() {
    }
    
    mutating func addLines(lines: [Line]) {
        for line in lines {
            self.lines.append(line)
        }
    }
}
