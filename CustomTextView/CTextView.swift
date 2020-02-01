//
//  CTextView.swift
//  CustomTextView
//
//  Created by Dima Dobrovolskyy on 01.02.2020.
//  Copyright © 2020 Dima Dobrovolskyy. All rights reserved.
//

import UIKit

class CTextView: UIView {
    
    // MARK: - UI Components
    
    private lazy var textView: TextViewWithPlaceholder = {
        let textView = TextViewWithPlaceholder()
        
        textView.textViewWithPlaceholderDelegate = self
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor),
            textView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            textView.bottomAnchor.constraint(equalTo: separator.topAnchor)
        ])
        
        return textView
    }()
    
    private lazy var separator: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            view.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        return view
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initConfigure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initConfigure()
    }
    
    // MARK: - Configuration
    
    private func initConfigure() {
        textView.configure()
        separator.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8274509804, blue: 0.8274509804, alpha: 1)
    }
    
}

// MARK: - Text view with placeholder delegate

extension CTextView: TextViewWithPlaceholderDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        separator.backgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8274509804, blue: 0.8274509804, alpha: 1)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        separator.backgroundColor = Colors.separatorOrangeColor
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text ?? "")
    }
    
}
