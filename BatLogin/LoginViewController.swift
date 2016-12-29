//
//  LoginViewController.swift
//  BatLogin
//
//  Created by Bear on 29/12/16.
//  Copyright © 2016 BearCreekMining. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var imgBatman: UIImageView!
    @IBOutlet weak var imgLetras: UIImageView!
    @IBOutlet weak var txtUser: UILabel!
    @IBOutlet weak var etUser: UITextField!
    @IBOutlet weak var txtContraseña: UILabel!
    @IBOutlet weak var etContraseña: UITextField!
    @IBOutlet weak var btnEntrar: UIButton!

    var headerAnimator: UIViewPropertyAnimator!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgBatman.transform = CGAffineTransform(translationX: 0.0, y: -120.0)
        imgLetras.transform = CGAffineTransform(translationX: 0.0, y: -170.0)
        txtUser.transform = CGAffineTransform(translationX: -200.0, y: 0.0)
        txtContraseña.transform = CGAffineTransform(translationX: -200.0, y: 0.0)
        etUser.transform = CGAffineTransform(translationX: 350.0, y: 0.0)
        etContraseña.transform = CGAffineTransform(translationX: 350.0, y: 0.0)
        btnEntrar.transform = CGAffineTransform(translationX: 0.0, y: 300.0)
        // Do any additional setup after loading the view.
    }

    func initVistas(){
        etUser.layer.cornerRadius = 3.0
        etContraseña.layer.cornerRadius = 3.0
        btnEntrar.layer.cornerRadius = 3.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initVistas()
        initAnimaciones()
    }
    
    func initAnimaciones()  {
        headerAnimator =    UIViewPropertyAnimator(duration: 0.6, curve: .easeInOut, animations: nil)
        headerAnimator.addAnimations {
            self.imgBatman.transform = CGAffineTransform.identity
            self.imgLetras.transform = CGAffineTransform.identity
            self.txtContraseña.transform = CGAffineTransform.identity
            self.txtUser.transform = CGAffineTransform.identity
            self.etUser.transform = CGAffineTransform.identity
            self.etContraseña.transform = CGAffineTransform.identity
            self.btnEntrar.transform = CGAffineTransform.identity
        }
        headerAnimator.startAnimation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
