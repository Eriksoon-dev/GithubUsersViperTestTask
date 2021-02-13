import UIKit

class UserListViewController: UIViewController, UserListViewControllerInput {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: UserListPresenterInput!
    private var users = [User]()
    
    // Loading Indicator
    private lazy var loader: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
        self.presenter.viewDidLoad()
    }
    
    private func setupViews() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: UserCell.nibName, bundle: nil), forCellReuseIdentifier: UserCell.reuseId)
        
        self.tableView.refreshControl = self.loader
    }
}

extension UserListViewController: UserListPresenterOutput {
    func updateUsers(_ users: [User]) {
        self.users = users
        self.tableView.reloadData()
    }
    
    func setLoading(isLoading: Bool) {
        if isLoading {
            self.loader.beginRefreshing()
        } else {
            self.loader.endRefreshing()
        }
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseId, for: indexPath) as! UserCell
        
        let user = self.users[indexPath.row]
        cell.configureWith(data: user)
        
        return cell
    }
}

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
