//
//  ViewController.swift
//  swift_flutter
//
//  Created by gd-hapy on 10/22/2023.
//  Copyright (c) 2023 gd-hapy. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    
    lazy var flutterEngine:FlutterEngine = FlutterEngine(name: "my flutter engine")
    lazy var flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        flutterEngine.run()
        
        flutterPlugin(messenger: flutterViewController as! FlutterBinaryMessenger)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        _pushToFlutter()
    }
}


extension ViewController {
    
    func _pushToFlutter() {
        let nav = UINavigationController(rootViewController: flutterViewController)
        flutterViewController.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    func flutterPlugin(messenger: FlutterBinaryMessenger) {
        let channel = FlutterMethodChannel(name: "plugin_apple", binaryMessenger: messenger)
        channel.setMethodCallHandler { [self]  (call, result) in
            if (call.method == "apple_one") {
                result(["result":"success","code":200, "data":"apple_one"]);
            }
            
            if (call.method == "apple_two") {
                result(["result":"success","code":404,"data":"apple_one"]);
            }
            
            if (call.method == "close_flutter_page") {
                flutterViewController.dismiss(animated: true)
            }
        }
    }
}

