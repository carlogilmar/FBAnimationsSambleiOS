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
        //let curvedView = CurvedView(frame: view.frame)
        //curvedView.backgroundColor = .yellow
        //view.addSubview(curvedView)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc func handleTap(){
        (0...10).forEach { (_) in
            generateAnimatedViews()
        }
    }
    
    fileprivate func generateAnimatedViews(){
        //image
        let image = drand48() < 0.5 ? #imageLiteral(resourceName: "md") : #imageLiteral(resourceName: "ce")
        let imageView = UIImageView(image: image)
        let dimension = 20 + drand48() * 10 // drand random number
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        //animation
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
        imageView.layer.add(animation, forKey: nil)
        view.addSubview(imageView)
    }
    
}

// curve!
func customPath() -> UIBezierPath {
    //draw the curve
    let path = UIBezierPath()
    let startPoint = CGPoint(x: 0, y: 200)
    path.move(to: startPoint)
    let endPoint = CGPoint(x: 400, y: 200)
    let randomyShift = 200 + drand48() * 300
    //path.addLine(to: endPoint)
    let controlPoint1 = CGPoint(x: 100, y: 100 - randomyShift)
    let controlPoint2 = CGPoint(x: 200, y: 300 - randomyShift)
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
