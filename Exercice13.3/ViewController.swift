//
//  ViewController.swift
//  Exercice13.3
//
//  Created by student5306 on 11/04/16.
//  Copyright © 2016 student5306. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let LINE_INDEX = 0
    private let RECT_INDEX = 1
    private let CIRCLE_INDEX = 2
    
    private let RED_INDEX = 0
    private let BLUE_INDEX = 1
    private let GREEN_INDEX = 2
    private let ORANGE_INDEX = 3
    private let YELLOW_INDEX = 4

    @IBOutlet weak var drawingView: DrawingView!
    @IBOutlet weak var thicknessSlider: UISlider!
    
    private var shapeType:ShapeType!
    private var shapeColor:ShapeColor!
    
    private var origin:CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.setNeedsDisplay()
        shapeType = ShapeType.Line
        shapeColor = ShapeColor.Red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancel(sender: AnyObject) {
        drawingView.cancel()
    }
    
    @IBAction func redo(sender: AnyObject) {
        drawingView.redo()
    }
    
    @IBAction func shapeSelection(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case LINE_INDEX:
            shapeType = ShapeType.Line
            break
        case RECT_INDEX:
            shapeType = ShapeType.Rect
            break
        case CIRCLE_INDEX:
            shapeType = ShapeType.Circle
            break
        default:
            break
        }
    }
    
    @IBAction func colorSelection(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case RED_INDEX:
            shapeColor = ShapeColor.Red
            break
        case BLUE_INDEX:
            shapeColor = ShapeColor.Blue
            break
        case GREEN_INDEX:
            shapeColor = ShapeColor.Green
            break
        case ORANGE_INDEX:
            shapeColor = ShapeColor.Orange
            break
        case YELLOW_INDEX:
            shapeColor = ShapeColor.Yellow
            break
        default:
            break
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        origin = touches.first?.preciseLocationInView(drawingView)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        drawingView.addShape(ShapeFactory.createShape(origin!, end: (touches.first?.preciseLocationInView(drawingView))!, shapetype: shapeType, thickness: CGFloat(thicknessSlider.value), color: shapeColor))
        drawingView.pendingShape = true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        drawingView.pendingShape = false
    }
    
}

