//
//  ViewController.swift
//  Slider
//
//  Created by Carlos Garcia Perez on 1/5/24.
//

import UIKit

final class SliderViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    var currentValue = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        slider.value = Float(currentValue)
    }
    @IBAction func SliderValueChanged(_ sender: UISlider) {
        currentValue = Double(sender.value)
    }
}

