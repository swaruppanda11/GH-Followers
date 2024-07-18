//
//  FavouritesListVC.swift
//  GH Followers
//
//  Created by Swarup Panda on 15/06/24.
//

import UIKit

class FavouritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
        
        PersistanceManager.retrieveFavourites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }

}
