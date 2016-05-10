//
//  ShapeFactory.swift
//  Exercice13.3
//
//  Created by student5306 on 11/04/16.
//  Copyright © 2016 student5306. All rights reserved.
//

import UIKit

enum ShapeType {
    case Line
    case Rect
    case Circle
}

enum ShapeColor {
    case Red
    case Blue
    case Green
    case Orange
    case Yellow
}

class ShapeFactory {
    
    static func createShape(origin:CGPoint, end:CGPoint, shapetype:ShapeType, thickness:CGFloat, color:ShapeColor) -> Shape {
        let shapePath = CGPathCreateMutable()
        CGPathMoveToPoint(shapePath, nil, origin.x, origin.y)
        switch shapetype {
        case .Line:
            CGPathAddLineToPoint(shapePath, nil, end.x, end.y)
            break
        case .Rect:
            CGPathAddRect(shapePath, nil, CGRectMake(origin.x, origin.y, end.x - origin.x, end.y - origin.y))
            break
        case .Circle:
            CGPathAddEllipseInRect(shapePath, nil, CGRectMake(origin.x, origin.y, end.x - origin.x, end.y - origin.y))
            break
        }
        
        let shapeColor:UIColor!
        switch color {
        case .Blue:
            shapeColor = UIColor.blueColor()
            break
        case .Green:
            shapeColor = UIColor.greenColor()
            break
        case .Orange:
            shapeColor = UIColor.orangeColor()
            break
        case .Red:
            shapeColor = UIColor.redColor()
            break
        case .Yellow:
            shapeColor = UIColor.yellowColor()
            break
        }
        
        return Shape(path: shapePath, thickness: thickness, color: shapeColor)
    }
}
