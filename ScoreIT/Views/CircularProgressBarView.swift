//
//  CircularProgressBarView.swift
//  ScoreIT
//
//  Created by Khondwani Sikasote on 2022/04/25.
// Learnt how to do animation from a tutorial and edited it to fit what i need it to do

import UIKit

class CircularProgressBarView: UIView {

   
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    let MAX_CREDIT_SCORE = 700.0
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
        createCircularPath()
     }
    
    func createCircularPath() {
        // created circularPath for circleLayer and progressLayer
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 100, startAngle: startPoint, endAngle: endPoint, clockwise: true)
            // circleLayer path defined to circularPath
            circleLayer.path = circularPath.cgPath
            // ui edits
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            circleLayer.lineWidth = 1.0
            circleLayer.strokeEnd = 1.0
            circleLayer.strokeColor = UIColor.white.cgColor
            // added circleLayer to layer
            layer.addSublayer(circleLayer)
            // progressLayer path defined to circularPath
            progressLayer.path = circularPath.cgPath
            // ui edits
            progressLayer.fillColor = UIColor.clear.cgColor
            progressLayer.lineCap = .round
            progressLayer.lineWidth = 1.0
            progressLayer.strokeEnd = 0
        progressLayer.strokeColor =  UIColor(red: 0.09, green: 0.37, blue: 0.53, alpha: 1.00).cgColor
            // added progressLayer to layer
            layer.addSublayer(progressLayer)
        }
    // created circularProgressAnimation with keyPath
    let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
    
    func progressAnimation(duration: TimeInterval, score: Int) {
            
            // set the end time
            circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = calculatePercentage(score:score)
            circularProgressAnimation.fillMode = .forwards
            circularProgressAnimation.isRemovedOnCompletion = false
            progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
        }
    // returns a value between 0 - 1 could be 0.5 which means the score was 50% and the circle will be filled half way
    func calculatePercentage(score: Int) -> Double {
//        print(Double(score)/MAX_CREDIT_SCORE)
        return Double(score)/MAX_CREDIT_SCORE
    }

}
