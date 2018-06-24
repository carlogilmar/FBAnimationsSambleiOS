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
        
    }

    
    
}

class CurvedView: UIView {
    
    override func draw(_ rect: CGRect) {
        //draw the curve
        let path = UIBezierPath()
        let startPoint = CGPoint(x: 0, y:200)
        path.move(to: startPoint)
        let endPoint = CGPoint(x: 200, y: 200)
        path.addLine(to: endPoint)
        path.stroke()
    }
    
}
