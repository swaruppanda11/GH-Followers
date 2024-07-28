//
//  FavouriteCell.swift
//  GH Followers
//
//  Created by Swarup Panda on 19/07/24.
//

import UIKit

class FavouriteCell: UITableViewCell {
    
    let padding: CGFloat = 12.0
    
    static let reuseID = "FavoriteCell"
    let avatarImage = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 26)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        Configure()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func set(favorite: Follower) {
        usernameLabel.text = favorite.login
        NetworkManager.shared.downloadImage(from: favorite .avatarUrl) { [weak self] image in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.avatarImage.image = image
            }
        }
    }
    
    private func Configure() {
        addSubview(avatarImage)
        addSubview(usernameLabel)
        
        accessoryType = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            avatarImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImage.heightAnchor.constraint(equalToConstant: 60),
            avatarImage.widthAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: (padding * 2)),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
