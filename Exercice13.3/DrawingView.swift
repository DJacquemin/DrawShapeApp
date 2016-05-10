//
//  DrawingView.swift
//  Exercice13.3
//
//  Created by student5306 on 11/04/16.
//  Copyright © 2016 student5306. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    
    private var currentIndex = 0;
    private var shapeList = [Shape]()
    internal var pendingShape = false
    
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context = UIGraphicsGetCurrentContext()
        for i in 0..<currentIndex {
            shapeList[i].color.setStroke()
            CGContextSetLineWidth(context, shapeList[i].thickness)
            CGContextAddPath(context, shapeList[i].path)
            CGContextStrokePath(context)
        }
    }
    
    func addShape(shape:Shape) {
        if(pendingShape) {
            shapeList.popLast()
            shapeList.append(shape)
        } else {
            if currentIndex != shapeList.count {
                shapeList.removeLast(shapeList.count - currentIndex)
            }
            shapeList.append(shape)
            ++currentIndex
        }
        setNeedsDisplay()
    }
    
    func redo() {
        if currentIndex < shapeList.count {
            ++currentIndex
        }
        setNeedsDisplay()
    }
    
    func cancel() {
        if currentIndex > 0 {
            --currentIndex
        }
        setNeedsDisplay()
    }

}
