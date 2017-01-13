//
//  BTFlashBag.swift
//  ECPractice
//
//  Created by Cong Can NGO on 12/30/16.
//  Copyright © 2016 vns. All rights reserved.
//

import Foundation
import UIKit

enum BTFlashMessageType {
    case success
    case info
    case danger
    case warning
}

class BTFlashMessage : UIView {
    
    static let infoColor = #colorLiteral(red: 0.1921568627, green: 0.4392156863, blue: 0.5607843137, alpha: 1)
    static let successColor = #colorLiteral(red: 0.2352941176, green: 0.462745098, blue: 0.2392156863, alpha: 1)
    static let warningColor = #colorLiteral(red: 0.5411764706, green: 0.4274509804, blue: 0.231372549, alpha: 1)
    static let dangerColor = #colorLiteral(red: 0.662745098, green: 0.2666666667, blue: 0.2588235294, alpha: 1)
    
    static let infoBgColor = #colorLiteral(red: 0.8509803922, green: 0.9294117647, blue: 0.968627451, alpha: 1)
    static let successBgColor = #colorLiteral(red: 0.8745098039, green: 0.9411764706, blue: 0.8470588235, alpha: 1)
    static let warningBgColor = #colorLiteral(red: 0.9882352941, green: 0.9725490196, blue: 0.8901960784, alpha: 1)
    static let dangerBgColor = #colorLiteral(red: 0.9490196078, green: 0.8705882353, blue: 0.8705882353, alpha: 1)
    
    static let infoBorderColor = #colorLiteral(red: 0.737254902, green: 0.9098039216, blue: 0.9450980392, alpha: 1)
    static let successBorderColor = #colorLiteral(red: 0.8392156863, green: 0.9137254902, blue: 0.7764705882, alpha: 1)
    static let warningBorderColor = #colorLiteral(red: 0.9803921569, green: 0.9215686275, blue: 0.8, alpha: 1)
    static let dangerBorderColor = #colorLiteral(red: 0.9215686275, green: 0.8, blue: 0.8196078431, alpha: 1)
    
    weak var lbHeader : UILabel!
    weak var lbMessage : UILabel!
    weak var btClose : UIButton!

    weak var heightConstraint : NSLayoutConstraint?

    
    static func showAdd(toView view: UIView, type : BTFlashMessageType , message: String, margin: UIEdgeInsets , animated : Bool, dismissAfter: TimeInterval?) -> BTFlashMessage{
        
//        BTFlashMessage.hide(fromView: view, animated: false)
        
        let flashBag = BTFlashMessage()
        flashBag.layer.borderWidth = 0.5
        flashBag.layer.cornerRadius = 2
        
        flashBag.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: flashBag, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: margin.top)
        
        let leadingConstraint = NSLayoutConstraint(item: flashBag, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: margin.left)
        
        let trailingConstraint = NSLayoutConstraint(item:view , attribute: .trailing, relatedBy: .equal, toItem: flashBag, attribute: .trailing, multiplier: 1, constant: margin.right)
        
        let heightConstraint = NSLayoutConstraint(item: flashBag, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        
        flashBag.heightConstraint = heightConstraint
        flashBag.addConstraint(heightConstraint)
        
        flashBag.initialize(type, message: message)
        flashBag.alpha = 0
        view.addSubview(flashBag)
        view.addConstraints([topConstraint, leadingConstraint,trailingConstraint])
        view.layoutIfNeeded()
        flashBag.show(animated, dismissAfter: dismissAfter)
        return flashBag
    }
    
    
    static func hide(fromView view : UIView , animated : Bool){
        for btFlashBagView in view.subviews {
            if let flashBag = btFlashBagView as? BTFlashMessage {
                flashBag.hide(animated)
            }
        }
    }
    
    
    fileprivate func initialize(_ type : BTFlashMessageType, message: String){
        let lbHeader = UILabel()
        let lbMessage = UILabel()
        let btClose = UIButton()
        lbHeader.clipsToBounds = true
        lbMessage.clipsToBounds = true
        btClose.clipsToBounds = true
        self.addSubview(btClose)
        self.addSubview(lbHeader)
        self.addSubview(lbMessage)
        lbHeader.font = UIFont.boldSystemFont(ofSize: 16)
        lbMessage.numberOfLines = 10
        btClose.setTitle("X", for: .normal)
        lbMessage.text = message
        
        lbHeader.translatesAutoresizingMaskIntoConstraints = false
        let centerHorConstraint = NSLayoutConstraint(item: lbHeader, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)

        let leadingConstraint = NSLayoutConstraint(item: lbHeader, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 10)
        
        let widthConstraintHeader = NSLayoutConstraint(item: lbHeader, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70)

        lbHeader.addConstraint(widthConstraintHeader)

        self.addConstraints([centerHorConstraint, leadingConstraint])
        
        lbMessage.translatesAutoresizingMaskIntoConstraints = false
        
        let centerHorConstraintMessage = NSLayoutConstraint(item: lbMessage, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)

        let leadingConstraintMessage = NSLayoutConstraint(item: lbMessage, attribute: .leading, relatedBy: .equal, toItem: lbHeader, attribute: .trailing, multiplier: 1, constant: 10)
        
        let trailingConstraintMessage = NSLayoutConstraint(item: btClose, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: lbMessage, attribute: .trailing, multiplier: 1, constant: 5)

        
        
        self.addConstraints([centerHorConstraintMessage, leadingConstraintMessage, trailingConstraintMessage])

        btClose.translatesAutoresizingMaskIntoConstraints = false
        let topConstraintBtClose = NSLayoutConstraint(item: btClose, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 5)
        let trailingConstraintBtClose = NSLayoutConstraint(item: self , attribute: .trailing, relatedBy: .equal, toItem: btClose, attribute: .trailing, multiplier: 1, constant: 5)
        let widthConstraintBtClose = NSLayoutConstraint(item: btClose, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)

        btClose.addConstraint(widthConstraintBtClose)
        
        self.addConstraints([topConstraintBtClose, trailingConstraintBtClose])
        
        btClose.addTarget(self, action: #selector(BTFlashMessage.actionClose(_:)), for: .touchUpInside)
        self.lbHeader = lbHeader
        self.lbMessage = lbMessage
        self.btClose = btClose
        
        //* --Init by type-- */
        switch type {
        case .danger:
            self.layer.borderColor = BTFlashMessage.dangerBorderColor.cgColor
            self.backgroundColor = BTFlashMessage.dangerBgColor
            self.lbHeader.textColor = BTFlashMessage.dangerColor
            self.lbMessage.textColor = BTFlashMessage.dangerColor
            self.btClose.setTitleColor(BTFlashMessage.dangerColor, for: .normal)
            self.lbHeader.text = NSLocalizedString("Error!", comment: "Error!")
            break
        case .info:
            self.layer.borderColor = BTFlashMessage.infoBorderColor.cgColor
            self.backgroundColor = BTFlashMessage.infoBgColor
            self.lbHeader.textColor = BTFlashMessage.infoColor
            self.lbMessage.textColor = BTFlashMessage.infoColor
            self.btClose.setTitleColor(BTFlashMessage.infoColor, for: .normal)
            self.lbHeader.text = NSLocalizedString("Info!", comment: "Info!")
            break
        case .warning:
            self.layer.borderColor = BTFlashMessage.warningBorderColor.cgColor
            self.backgroundColor = BTFlashMessage.warningBgColor
            self.lbHeader.textColor = BTFlashMessage.warningColor
            self.lbMessage.textColor = BTFlashMessage.warningColor
            self.btClose.setTitleColor(BTFlashMessage.warningColor, for: .normal)
            self.lbHeader.text = NSLocalizedString("Warning!", comment: "Warning!")
        
            break
        case .success:
            self.layer.borderColor = BTFlashMessage.successBorderColor.cgColor
            self.backgroundColor = BTFlashMessage.successBgColor
            self.lbHeader.textColor = BTFlashMessage.successColor
            self.lbMessage.textColor = BTFlashMessage.successColor
            self.btClose.setTitleColor(BTFlashMessage.successColor, for: .normal)
            self.lbHeader.text = NSLocalizedString("Success!", comment:"Success!")
            break
        }
        /*******/
        
        self.layoutIfNeeded()

    }
    
    
    func actionClose(_ sender: UIButton){
        self.hide(true)
    }
    
    func hide(_ animated: Bool){
        if animated {
            UIView.animate(withDuration: 1,
                           delay: 0.1,
                           options: .curveEaseOut,
                           animations: { [weak self] () -> Void in
                            self?.alpha = 0
                            self?.superview?.layoutIfNeeded()
                }, completion: { [weak self] (finished) -> Void in
                    self?.removeFromSuperview()
            })
        } else {
            self.removeFromSuperview()
        }
        
        
    }
    
    func show(_ animated: Bool, dismissAfter: TimeInterval?){
        
        UIView.animate(withDuration: 1,
                       delay: 0.1,
                       options: .curveEaseIn,
                       animations: { [weak self] () -> Void in
                        self?.alpha = 1
                        self?.superview?.layoutIfNeeded()
            }, completion: { [weak self] (finished) -> Void in
                
                if let dismissAfter = dismissAfter {
                    UIView.animate(withDuration: dismissAfter, animations: { [weak self]() -> Void in
                        self?.hide(animated)
                    })
                }
                
                print("btClose frame \(self?.btClose)")
                print("lbHeader frame \(self?.lbHeader)")
                print("lbMessage frame \(self?.lbMessage)")
        })
        
    }

}
