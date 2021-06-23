//
//  ViewController.swift
//  SpringHW
//
//  Created by Igor Makeev on 22.06.2021.
//

import UIKit
import Spring

class ViewController: UIViewController {
    
    let settings = Animation.getAnimations()
    var index = 0

    @IBOutlet var viewAnimation: SpringView!
    @IBOutlet var animationLabel: SpringLabel!
    @IBOutlet var animationButton: SpringButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAnimation.layer.cornerRadius = 15
        animationButton.layer.cornerRadius = 10
    
    }

    @IBAction func tappedButton(_ sender: SpringButton) {
        
        viewAnimation.animation = settings[index].animation
        viewAnimation.curve = settings[index].curve
        viewAnimation.duration = CGFloat(settings[index].duration)
        viewAnimation.force = CGFloat(settings[index].force)
        animationLabel.text = settings[index].description
        viewAnimation.animate()
        
        if index == settings.count - 1{
            animationButton.setTitle("Next animation: \(settings[0].animation)", for: .normal)
            index = 0
        } else{
            animationButton.setTitle("Next animation: \(settings[index + 1].animation)", for: .normal)
            index += 1
        }
    }
}

