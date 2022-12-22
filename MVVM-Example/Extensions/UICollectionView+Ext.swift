//
//  UICollectionView+Ext.swift
//  MVVM-Example
//
//  Created by Burak on 17.12.2022.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
