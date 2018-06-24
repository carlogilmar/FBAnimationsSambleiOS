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
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "md"))
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view.addSubview(imageView)
        
    }
    
}

class CurvedView: UIView {
    
    override func draw(_ rect: CGRect) {
        //draw the curve
        let path = UIBezierPath()
        let startPoint = CGPoint(x: 0, y:200)
        path.move(to: startPoint)
        let endPoint = CGPoint(x: 400, y: 200)
        //path.addLine(to: endPoint)
        let controlPoint1 = CGPoint(x: 100, y: 100)
        let controlPoint2 = CGPoint(x: 200, y: 300)
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        path.lineWidth = 3
        path.stroke()
    }
    
}
