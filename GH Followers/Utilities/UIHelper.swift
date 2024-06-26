//
//  UIHelper.swift
//  GH Followers
//
//  Created by Swarup Panda on 26/06/24.
//

import UIKit

struct UIHelper {
    
    static func CreateThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        var width = view.bounds.width
        var padding: CGFloat = 12
        var minimumSpacing: CGFloat = 10
        var availableWidth = width - (padding * 2) - (minimumSpacing * 2)
        var cellWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth + 40)
        
        return flowLayout
    }
}
