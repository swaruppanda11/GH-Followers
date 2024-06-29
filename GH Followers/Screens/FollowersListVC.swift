import UIKit

class FollowersListVC: UIViewController {
    
    enum Section {
        case Main
    }
    
    var followers: [Follower] = []
    var page: Int = 1
    var hasMoreFollowers: Bool = true
    
    var username: String!
    var collectionView: UICollectionView!
    var datasource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureViewController()
        GetFollowers(username: username, page: page)
        ConfigureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.CreateThreeColumnFlowLayout(in: view))
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
        view.addSubview(collectionView)
    }
    
    func configureViewController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }
    
    func GetFollowers(username: String, page: Int) {
        showLoadingView()
        NetworkManager.shared.GetFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else {
                return
            }
            dismissLoadingView()
            
            switch result {
            case .success(let followers):
                if followers.count < 100 {
                    self.hasMoreFollowers = false
                }
                self.followers.append(contentsOf: followers)
                if self.followers.isEmpty {
                    DispatchQueue.main.async {
                        let message = "This user does not have any followers. Go follow them!"
                        self.showEmptyStateView(with: message, in: self.view)
                        return
                    }
                }
                self.UpdateData()
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func ConfigureDataSource() {
        datasource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func UpdateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.Main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.datasource.apply(snapshot, animatingDifferences: true)
        }
    }
}

extension FollowersListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else { return }
            page += 1
            GetFollowers(username: username, page: page)
        }
        
    }
}

