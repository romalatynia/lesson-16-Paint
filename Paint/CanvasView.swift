//
//  CanvasView.swift
//  Paint
//
//  Created by Harbros47 on 19.01.21.
//

import UIKit

class CanvasView: UIView {

    private var touchPoint = CGPoint()
    private var startingPoint = CGPoint()
    private var lastPoint = CGPoint()
    var lineArray = [Line]()
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        UIColor.systemBlue.setStroke()
        context.setLineCap(.round)
        context.setLineWidth(10)
        for line in lineArray {
            context.move(to: line.firstPoint)
            context.addLine(to: line.lastPoint)
            context.strokePath()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        startingPoint = touch.location(in: self)
        lineArray.append(Line(firstPoint: startingPoint, lastPoint: startingPoint))
        self.setNeedsDisplay()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        touchPoint = touch.location(in: self)
        lineArray.append(Line(firstPoint: startingPoint, lastPoint: touchPoint))
        startingPoint = touchPoint
        self.setNeedsDisplay()
    }
}
