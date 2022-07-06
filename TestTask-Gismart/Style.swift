//
//  UILabel-Extention.swift
//  TestTask-Gismart
//
//  Created by Tony on 4.07.22.
//

import UIKit

class labelStyle : UILabel {
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet{
            self.layer.masksToBounds = true
            self.layer.cornerRadius = cornerRadius
        }
    }
}

