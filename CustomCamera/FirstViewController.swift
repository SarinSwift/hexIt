//
//  FirstViewController.swift
//  CustomCamera
//
//  Created by Sarin Swift on 11/4/18.
//  Copyright © 2018 sarinswift. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.gradientBackgroundColor(colorOne: .lightOrange, colorTwo: .lightYellow)
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
    }
}
