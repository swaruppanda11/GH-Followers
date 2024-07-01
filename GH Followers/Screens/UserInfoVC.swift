//
//  UserInfoVC.swift
//  GH Followers
//
//  Created by Swarup Panda on 01/07/24.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }

    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
