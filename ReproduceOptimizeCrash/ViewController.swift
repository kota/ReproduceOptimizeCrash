//
//  ViewController.swift
//  ReproduceOptimizeCrash
//
//  Created by fujiwara.kota on 2016/04/01.
//  Copyright © 2016年 Moneyforward. All rights reserved.
//

import UIKit

class SomeModel {
    var name: String = "name"
}

class ViewController: UIViewController {
    var array = [SomeModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = [1,2,3,4,5]
        array = a.reduce([SomeModel](), combine: { arr, i in
            /* これはクラッシュする
            let m = SomeModel()
            return arr + [m]
            */
            
            /*
            これはクラッシュしない
            return arr + [SomeModel()]
            */
            
            //これもクラッシュ
            let m = SomeModel()
            let tmp = arr + [m]
            return tmp
        })
    }
   
    @IBAction func touchUpButton(sender: AnyObject) {
        print(array.first!)
    }
}

