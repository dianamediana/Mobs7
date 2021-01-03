//
//  MyChartView.swift
//  Mediana
//
//  Created by dianaMediana on 03.01.2021.
//

import Foundation
import UIKit

@IBDesignable
class MyChartView: UIView {
    
    var yellowTune: CGFloat = 15.0
    var brownTune: CGFloat = 25.0
    var grayTune: CGFloat = 50.0
    var redTune: CGFloat = 10.0
        
    override func draw(_ rect: CGRect) {
        let rad: CGFloat = 81.0
        let yellow = UIBezierPath()
        let brown = UIBezierPath()
        let gray = UIBezierPath()
        let red = UIBezierPath()
        yellow.lineWidth = 32.0
        brown.lineWidth = 32.0
        gray.lineWidth = 32.0
        red.lineWidth = 32.0
        yellow.addArc(withCenter: CGPoint(x: self.bounds.width / CGFloat(2.0), y: self.bounds.height / CGFloat(2.4)), radius: rad, startAngle: 0, endAngle: 2 * CGFloat.pi * yellowTune / 100, clockwise: true)
        brown.addArc(withCenter: CGPoint(x: self.bounds.width / CGFloat(2.0), y: self.bounds.height / CGFloat(2.4)), radius: rad, startAngle: 2 * CGFloat.pi * yellowTune / 100, endAngle: 2 * CGFloat.pi * (yellowTune + brownTune) / 100, clockwise: true)
        gray.addArc(withCenter: CGPoint(x: self.bounds.width / CGFloat(2.0), y: self.bounds.height / CGFloat(2.4)), radius: rad, startAngle: 2 * CGFloat.pi * (yellowTune + brownTune) / 100, endAngle: 2 * CGFloat.pi * (yellowTune + brownTune + grayTune) / 100, clockwise: true)
        red.addArc(withCenter: CGPoint(x: self.bounds.width / CGFloat(2.0), y: self.bounds.height / CGFloat(2.4)), radius: rad, startAngle: 2 * CGFloat.pi * (yellowTune + brownTune + grayTune) / 100, endAngle: 2 * CGFloat.pi, clockwise: true)
        UIColor.yellow.setStroke()
        yellow.stroke()
        UIColor.brown.setStroke()
        brown.stroke()
        UIColor.gray.setStroke()
        gray.stroke()
        UIColor.red.setStroke()
        red.stroke()
    }
}
