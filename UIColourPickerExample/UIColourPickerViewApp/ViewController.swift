//
//  ViewController.swift
//  UIColourPickerViewApp
//
//  Created by Gerry on 03/05/2019.
//  Copyright © 2019 jameschip. All rights reserved.
//

import UIKit
import UIColourPicker

class ViewController: UIViewController, UIColourPickerAlertDelegate {
    
    func didSelectColour(sender: Any, colour: UIColor) {
        print(colour)
        self.view.backgroundColor = colour
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonPress(_ sender: Any) {
        let cp = UIColourPickerAlert()
        cp.delegate = self
        cp.setColourString(colour: view.backgroundColor!.toHexString())
        present(cp, animated: true, completion: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "picker" {
//            if let v = segue.destination as? UIColourPickerAlert {
//                v.delegate = self
//                v.setColourString(colour: (view.backgroundColor?.toHexString())!)
//            }
//
//        }
//    }
}

