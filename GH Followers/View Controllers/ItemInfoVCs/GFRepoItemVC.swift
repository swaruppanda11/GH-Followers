//
//  GFRepoItemVC.swift
//  GH Followers
//
//  Created by Swarup Panda on 03/07/24.
//

import Foundation

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureItems()
    }
    
    private func ConfigureItems() {
        itemInfoView1.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoView2.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
}
