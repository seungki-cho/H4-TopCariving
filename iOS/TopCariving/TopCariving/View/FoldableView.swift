//
//  FoldableView.swift
//  TopCariving
//
//  Created by cho seungki on 2023/08/05.
//

import UIKit
import Combine

protocol Foldable {
    var heightConstant: NSLayoutConstraint? { get set }
    
    func fold()
    func unfold()
}

