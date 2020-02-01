//
//  ViewController.swift
//  CustomTextView
//
//  Created by Dima Dobrovolskyy on 01.02.2020.
//  Copyright © 2020 Dima Dobrovolskyy. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func hideKeyboard(_ gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}
