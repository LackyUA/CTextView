//
//  TextViewWithPlaceholder.swift
//  CustomTextView
//
//  Created by Dima Dobrovolskyy on 01.02.2020.
//  Copyright © 2020 Dima Dobrovolskyy. All rights reserved.
//

import UIKit

protocol TextViewWithPlaceholderDelegate: class {
    
    /// Tells the delegate that editing of the specified text view has ended.
    ///
    /// - Parameter textView: Text view in which editing ended.
    func textViewDidEndEditing(_ textView: UITextView)
    
    /// Tells the delegate that editing of the specified text view has begun.
    ///
    /// - Parameter textView: Text view in which editing begun.
    func textViewDidBeginEditing(_ textView: UITextView)
    
    /// Tells the delegate that text of the specified text view has changed.
    ///
    /// - Parameter textView: Text view in which text changed.
    func textViewDidChange(_ textView: UITextView)
    
}

final class TextViewWithPlaceholder: UITextView {
    
    // MARK: - Weak properties
    
    weak var textViewWithPlaceholderDelegate: TextViewWithPlaceholderDelegate?
    
    // MARK: - Properties
    
    var placeholderIsOnTop = false
    
    var placeholder: String = "Please enter the text..." {
        didSet {
            placeholderLabel.text = placeholder
        }
    }
    
    // MARK: - UI Components
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 4)
        ])
        
        return label
    }()
    
    // MARK: - Configuration
    
    func configure() {
        delegate = self
        clipsToBounds = false
        returnKeyType = .done
        isScrollEnabled = false
        placeholderLabel.text = placeholder
        tintColor = Colors.textViewTintColor
        font = UIFont.systemFont(ofSize: 16)
        textContainer.lineFragmentPadding = 0
    }
    
    // MARK: - Animation
    
    private func animateEditingBeginning(_ placeholder: UILabel) {
        guard !placeholderIsOnTop else { return }
        
        UIView.animate(withDuration: 0.3) {
            let scaleRate: CGFloat = 0.75
            let xTranslationOffset = placeholder.frame.width * (1 - scaleRate) / 2
            let scale = CGAffineTransform(scaleX: scaleRate, y: scaleRate)
            let translate = CGAffineTransform(translationX: -xTranslationOffset, y: -placeholder.frame.height - 8)
            
            placeholder.transform = scale.concatenating(translate)
        }
        
        placeholderIsOnTop.toggle()
    }
    
    private func animateEditingEnding(_ placeholder: UILabel) {
        UIView.animate(withDuration: 0.3) {
            placeholder.transform = .identity
        }
        
        placeholderIsOnTop.toggle()
    }
    
}

// MARK: - Text view delegate

extension TextViewWithPlaceholder: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textViewWithPlaceholderDelegate?.textViewDidBeginEditing(textView)
        placeholderLabel.textColor = Colors.separatorOrangeColor
        animateEditingBeginning(placeholderLabel)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textViewWithPlaceholderDelegate?.textViewDidEndEditing(textView)
        placeholderLabel.textColor = #colorLiteral(red: 0.8274509804, green: 0.8274509804, blue: 0.8274509804, alpha: 1)
        
        if let text = textView.text, text.isEmpty {
            animateEditingEnding(placeholderLabel)
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            resignFirstResponder()
            return false
        }
        
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textViewWithPlaceholderDelegate?.textViewDidChange(textView)
    }
    
}
