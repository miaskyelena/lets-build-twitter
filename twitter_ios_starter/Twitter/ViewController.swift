//
//  ViewController.swift
//  Twitter
//
//  Created by Mia Elena on 2/26/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class ViewController: UIViewController{
    
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupAnimation()
    }
    
   private func setupAnimation(){
        animationView.animation = Animation.named("bird_two")
        animationView.frame = view.bounds
        //animationView.backgroundColor = .systemBlue
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
    }
    
}
