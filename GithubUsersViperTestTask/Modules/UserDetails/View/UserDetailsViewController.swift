import UIKit

class UserDetailsViewController: UIViewController, UserDetailsViewControllerInput {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    var presenter: UserDetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.avatarImageView.clipsToBounds = true
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.width / 2
    }
}

extension UserDetailsViewController: UserDetailsPresenterOutput {
    func updateUserDetails(details: UserDetail) {
        self.avatarImageView.loadWithCaching(urlString: details.avatar)
        self.loginLabel.text = details.login
        self.nameLabel.text = details.name
        self.cityLabel.text = "Location: \(details.location)"
        self.followersLabel.text = String(details.followers)
        self.followingLabel.text = String(details.following)
    }
}
