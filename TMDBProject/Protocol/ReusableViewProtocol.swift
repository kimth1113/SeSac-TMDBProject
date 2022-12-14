//
//  ReusableViewProtocol.swift
//  TMDBProject
//
//  Created by κΉνν on 2022/08/08.
//

import UIKit

protocol ReusableViewProtocol {
    
    static var reuseIdentifier: String { get }
}

extension UIViewController: ReusableViewProtocol {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableViewProtocol {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
