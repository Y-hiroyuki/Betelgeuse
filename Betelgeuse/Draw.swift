//
//  Draw.swift
//  Betelgeuse
//
//  Created by 由上博之 on 2021/08/15.
//

import UIKit

class Draw: UIView {
    override func draw(_ rect: CGRect) {
        let line = UIBezierPath();
        line.move(to: CGPoint(x: 0, y: 5))
        line.addLine(to: CGPoint(x: 430, y: 5))
        line.close()
        UIColor.red.setStroke()
        line.lineWidth = 3
        line.stroke()
    }
}
