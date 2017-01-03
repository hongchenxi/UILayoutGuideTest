//
//  ViewController.swift
//  UILayoutGuideTest
//
//  Created by 晨希 on 1/3/17.
//  Copyright © 2017 cx. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        setupView1()
        setupView2()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView1() {
        let label = UILabel()
        label.text = "test";
        view.addSubview(label)
        
        let testView = UIView()
        testView.backgroundColor = UIColor.blue
        view.addSubview(testView)
        
        let container = UILayoutGuide()
        view.addLayoutGuide(container)
        
        label.snp.makeConstraints { (make) in
            make.left.equalTo(container)
            make.centerY.equalTo(container)
        }
        
        testView.snp.makeConstraints { (make) in
            make.left.equalTo(label.snp.right).offset(10)
            make.width.equalTo(80)
            make.height.equalTo(40)
            make.right.equalTo(container)
            make.centerY.equalTo(container)
        }
        
        container.snp.makeConstraints{ (make) in
            make.height.equalTo(1)
            make.center.equalTo(view)
        }
    }

    
    func setupView2() {
        let leftView = UIView()
        leftView.backgroundColor = UIColor.yellow
        view.addSubview(leftView)
        
        let rightView = UIView()
        rightView.backgroundColor = UIColor.red
        view.addSubview(rightView)
        
        
        let container1 = UILayoutGuide()
        view.addLayoutGuide(container1)
        
        let container2 = UILayoutGuide()
        view.addLayoutGuide(container2)
        
        let container3 = UILayoutGuide()
        view.addLayoutGuide(container3)
        
        let viewHeight: CGFloat  = 60
        let containerWidth: CGFloat = 20
        
        leftView.snp.makeConstraints { (make) in
            make.left.equalTo(container1.snp.right)
            make.right.equalTo(container2.snp.left)
            make.centerY.equalTo(container2)
            make.height.equalTo(viewHeight)
        }
        
        rightView.snp.makeConstraints { (make) in
            make.left.equalTo(container2.snp.right)
            make.right.equalTo(container3.snp.left)
            make.centerY.equalTo(container2)
            make.height.equalTo(leftView)
        }
        
        container1.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.width.equalTo(containerWidth)
            make.centerY.equalTo(container2)
        }
        
        container2.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.width.equalTo(container1)
        }

        container3.snp.makeConstraints { (make) in
            make.right.equalTo(view)
            make.width.equalTo(container1)
            make.centerY.equalTo(container2)
        }

    }

}

