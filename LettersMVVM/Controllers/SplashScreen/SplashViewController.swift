//
//  SplashViewController.swift
//  LettersMVVM
//
//  Created by Raphael Oliveira Chagas on 14/02/20.
//  Copyright © 2020 Raphael Oliveira Chagas. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var letterLabel: UILabel!
    
    let letters: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    let finalAnimationDuration = 1.5
    let finalLabelFontSize: CGFloat = 40
    let scaleFont: CGFloat = 2.0
    let timeToOpenScreen: TimeInterval = 3.0
    let timeToDecreaseInAnimation: TimeInterval = 0.02
    let lastAnimationTime: TimeInterval = 0.08
    let lettersText = "Letras"
    
    var timer: Timer?
    var seconds: TimeInterval = 0.2
    var letterPosition = 0
    var coordinator: SplashCoordinator?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationController?.isNavigationBarHidden = true
        timer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(doAnimation), userInfo: nil, repeats: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc private func doAnimation() {
        if letterPosition < letters.count {
            letterLabel.text = letters[letterPosition]
            letterPosition.moreOne()
            if seconds > lastAnimationTime {
                seconds -= timeToDecreaseInAnimation
            }
            timer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: #selector(doAnimation), userInfo: nil, repeats: false)
        } else {        
            timer = Timer.scheduledTimer(timeInterval: timeToOpenScreen, target: self, selector: #selector(openNewScreen), userInfo: nil, repeats: false)
            UIView.animate(withDuration: finalAnimationDuration) {
                self.letterLabel.text = self.lettersText
                self.letterLabel.font = self.letterLabel.font.withSize(self.finalLabelFontSize)
                self.letterLabel.transform = CGAffineTransform(scaleX: self.scaleFont, y: self.scaleFont)
            }
        }
    }
    
    @objc private func openNewScreen() {
        coordinator?.openLettersScreen()
    }
}
