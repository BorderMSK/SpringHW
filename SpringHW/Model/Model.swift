//
//  Model.swift
//  SpringHW
//
//  Created by Igor Makeev on 23.06.2021.
//

import UIKit

struct Animation {
    let animation: String
    let curve: String
    let force: Double
    let duration: Double
    
    var description: String {
        """
        animation: \(animation)
        curve: \(curve)
        force: \(String(format: "%.2f", force))
        duration: \(String(format: "%.2f", duration))
        """
    }
}

extension Animation{
    
    static func getAnimations() -> [Animation]{
        var randomAnimations = [Animation]()
        
        let animations = Data.randomAnimation.animations.shuffled()
        let curves = Data.randomAnimation.curves.shuffled()
        
        let counts = min(animations.count, curves.count)
        let randomForces = Double.random(in: 0...5)
        let randomDuration = Double.random(in: 0...4)
        
        for index in 0..<counts{
            let animationsRandom = Animation(animation: animations[index].rawValue,
                                             curve: curves[index].rawValue,
                                             force: randomForces,
                                             duration: randomDuration)
            
            randomAnimations.append(animationsRandom)
        }
        return randomAnimations
    }
}
