//
//  ViewController.swift
//  FBStreamAnimation
//
//  Created by Carlo Gilmar on 24/06/18.
//  Copyright © 2018 Carlo Gilmar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let curvedView = CurvedView(frame: view.frame)
        curvedView.backgroundColor = .yellow
        view.addSubview(curvedView)
        
        //image
        let imageView = UIImageView(image: #imageLiteral(resourceName: "md"))
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        //animation
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        imageView.layer.add(animation, forKey: nil)
        view.addSubview(imageView)
        
    }
    
}

// curve!
func customPath() -> UIBezierPath {
    //draw the curve
    let path = UIBezierPath()
    let startPoint = CGPoint(x: 0, y:200)
    path.move(to: startPoint)
    let endPoint = CGPoint(x: 400, y: 200)
    //path.addLine(to: endPoint)
    let controlPoint1 = CGPoint(x: 100, y: 100)
    let controlPoint2 = CGPoint(x: 200, y: 300)
    path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
    return path
}

class CurvedView: UIView {
    override func draw(_ rect: CGRect) {
        let path = customPath()
        path.lineWidth = 3
        path.stroke()
    }
}
