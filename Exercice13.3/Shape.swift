//
//  Shape.swift
//  Exercice13.3
//
//  Created by student5306 on 11/04/16.
//  Copyright © 2016 student5306. All rights reserved.
//

import UIKit

struct Shape {
    
    internal let path:CGPath!
    internal let color:UIColor!
    internal let thickness:CGFloat!
    
    init(path:CGPath, thickness:CGFloat, color:UIColor) {
        self.path = path
        self.thickness = thickness
        self.color = color
    }
    
}
