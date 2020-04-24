//
//  ViewController.swift
//  06 Alert
//
//  Created by Gukhwa Jeon on 24.04.20.
//  Copyright © 2020 G-Kay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    var isLampOn = true
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lampImg.image = imgOn
    }
    
    @IBAction func btnLampOn(_ sender: UIButton) {
        if (isLampOn) {
            let lampOnAlert = UIAlertController(title: "Warning", message: "Lamp is already On", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil) // 특별한 동작시 handler설정
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if (isLampOn) {
            let lampOffAlert = UIAlertController(title: "Turning Off", message: "Do you want to turn off the lamp?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { // Anonymous Function or Closure
                ACTION in
                self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            let cancleAction = UIAlertAction(title: "Cancle", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancleAction)
            present(lampOffAlert, animated: true, completion: nil)
        } else {
            
        }
    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "Remove Lamp", message: "Do you want to remove the lamp", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "No, Turn Off", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "No, Turn On", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        let removeAction = UIAlertAction(title: "Yes, Remove it", style: UIAlertAction.Style.destructive, handler: {
            ACTI in
            self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
        
    }
    
}

