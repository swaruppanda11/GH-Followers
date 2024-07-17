//
//  GFFollowerItemVC.swift
//  GH Followers
//
//  Created by Swarup Panda on 03/07/24.
//

import Foundation

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureItems()
    }
    
    private func ConfigureItems() {
        itemInfoView1.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoView2.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
