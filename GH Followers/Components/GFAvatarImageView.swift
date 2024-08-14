//
//  GFImageView.swift
//  GH Followers
//
//  Created by Swarup Panda on 23/06/24.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeholderImage = Images.placeholder
    let cache = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Configure()
    }
    
    required init?(coder: NSCoder) { nil }
    
    
    private func Configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
