//
//  tipLabel.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/10/2023.
//

import UIKit
class ToolTip: UILabel {
    var roundRect:CGRect!
    override func drawText(in rect: CGRect) {
        super.drawText(in: roundRect)
    }
    override func draw(_ rect: CGRect) {
        roundRect = CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: rect.height * 4 / 5)
        let roundRectBez = UIBezierPath(roundedRect: roundRect, cornerRadius: 10.0)
        let triangleBez = UIBezierPath()
        triangleBez.move(to: CGPoint(x: roundRect.minX + roundRect.width / 2.5, y:roundRect.maxY))
        triangleBez.addLine(to: CGPoint(x:rect.midX,y:rect.maxY))
        triangleBez.addLine(to: CGPoint(x: roundRect.maxX - roundRect.width / 2.5, y:roundRect.maxY))
        triangleBez.close()
        roundRectBez.append(triangleBez)
        let bez = roundRectBez
        UIColor.lightGray.setFill()
        bez.fill()
        super.draw(rect)
    }}
