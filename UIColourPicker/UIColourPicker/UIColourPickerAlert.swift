//
//  UIColourPickerAlert.swift
//  UIColourPickerViewApp
//
//  Created by James Henderson on 03/05/2019.
//  Copyright © 2019 jameschip. All rights reserved.
//

import Foundation
import UIKit

public protocol UIColourPickerAlertDelegate {
    func didSelectColour(sender: Any, colour: UIColor)
}

public class UIColourPickerAlert: UIViewController {
    
    public var delegate: UIColourPickerAlertDelegate?
    
    @IBOutlet var select_button: UIButton!
    @IBOutlet var cancel_button: UIButton!
    @IBOutlet var colour_preview: UIView!
    @IBOutlet var red_slider: UISlider!
    @IBOutlet var blue_slider: UISlider!
    @IBOutlet var green_slider: UISlider!
    @IBOutlet var hex_code: UILabel!
    @IBOutlet var background: UIView!
    
    var hex: String?
    
    public init() {
        super.init(nibName: "UIColourPickerAlert", bundle: Bundle(for: UIColourPickerAlert.self))
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        if let hv = hex {
            if hex_code.text != nil {
                hex_code.text = hv
                colour_preview.backgroundColor = UIColor(hexString: hv)
                slidersToColour(fromHex: hv)
            }
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func selected(_ sender: Any) {
        if let d = delegate {
            if let hs = hex_code.text {
                d.didSelectColour(sender: self, colour: UIColor(hexString: hs))
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func redValueChanged(_ sender: Any) {
        if sender is UISlider {
            let r = red_slider.value
            let g = green_slider.value
            let b = blue_slider.value
            updateHexValue(red: r, green: g, blue: b)
        }
    }
    
    @IBAction func greenValueChanged(_ sender: Any) {
        if sender is UISlider {
            let r = red_slider.value
            let g = green_slider.value
            let b = blue_slider.value
            updateHexValue(red: r, green: g, blue: b)
        }
    }
    
    @IBAction func blueValueChanged(_ sender: Any) {
        if sender is UISlider {
            let r = red_slider.value
            let g = green_slider.value
            let b = blue_slider.value
            updateHexValue(red: r, green: g, blue: b)
        }
    }
    
    fileprivate func updateHexValue(red: Float, green: Float, blue: Float) {
        let r = String(format:"%02X", Int(red))
        let g = String(format:"%02X", Int(green))
        let b = String(format:"%02X", Int(blue))
        
        hex_code.text = "#" + r + g + b
        if let c = hex_code.text {
            colour_preview.backgroundColor = UIColor(hexString: c)
        }
    }
    
    public func setColourString(colour: String) {
        hex = colour
    }
    
    fileprivate func slidersToColour(fromHex: String) {
        var s_val = fromHex
        if fromHex.hasPrefix("#") {
            s_val.remove(at: fromHex.startIndex)
        }
        if let val = Int(s_val, radix: 16)  {
            let r = (val & 0xFF0000) >> 16
            let g = (val & 0x00FF00) >> 8
            let b = (val & 0xFF)
            red_slider.value = Float(r)
            green_slider.value = Float(g)
            blue_slider.value = Float(b)
        }
    }
}

