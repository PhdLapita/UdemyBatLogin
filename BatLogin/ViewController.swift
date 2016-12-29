//
//  ViewController.swift
//  BatLogin
//
//  Created by Bear on 28/12/16.
//  Copyright © 2016 BearCreekMining. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtInstrucciones: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    
    var viewAnimator: UIViewPropertyAnimator!
    private let unlockGesture = UIPanGestureRecognizer()
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unlockGesture.addTarget(self, action: #selector(handle(pan: )))
        self.view.addGestureRecognizer(unlockGesture)
        viewAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: nil)
        viewAnimator.addAnimations {
            self.txtInstrucciones.layer.opacity = 0
            self.imgLogo.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }
       
    }
    
    
    func handle ( pan: UIPanGestureRecognizer){
        let speed : CGFloat = 2.0
        switch pan.state {
        case .began:
            viewAnimator.pauseAnimation()
        case .changed:
            let translation = pan.translation(in: pan.view).y / speed
            viewAnimator.fractionComplete = translation / 100
            if viewAnimator.fractionComplete >= 0.99{
                buildAnimation()
            }
        default:
            break
        }
    }

    func buildAnimation()  {
        let logoAnimator = UIViewPropertyAnimator(duration: 0.5, curve : .easeIn){
            self.imgLogo.transform = CGAffineTransform(scaleX: 25.0, y: 25.0)
        }
        logoAnimator.startAnimation()
        logoAnimator.addCompletion { (UIViewAnimatingPosition) in
            self.beginApp()
        }
    }
    
    func beginApp(){//para ir a un nuevo activity
        let loginViewController =  self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        self.present(loginViewController!, animated: true, completion: nil)
    }
    
    
 }

