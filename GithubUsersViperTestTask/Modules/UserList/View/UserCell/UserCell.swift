import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userLoginLabel: UILabel!
    
    static let reuseId: String = String(describing: self)
    
    func configureWith(data: User) {
        self.avatarImageView.loadWithCaching(urlString: data.avatar)
        self.userLoginLabel.text = data.login
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Prepare ImageView
        self.avatarImageView.clipsToBounds = true
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.size.width / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()

        self.avatarImageView.image = nil
    }
}
