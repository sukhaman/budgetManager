//
//  Created by Sukhaman Singh on 3/23/24.
//

import UIKit

class BudgetTypeInfoCell: UICollectionViewCell {
    static let reuseID = "BudgetTypeInfoCell"
    var imageAvatar: UIImageView = {
     let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    var lblName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        self.init()
        configure()
    }
    
    private func configure() {
        addSubview(imageAvatar)
        addSubview(lblName)
        NSLayoutConstraint.activate([
            imageAvatar.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            imageAvatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageAvatar.widthAnchor.constraint(equalToConstant: 10),
            lblName.heightAnchor.constraint(equalToConstant: 10),
            
            lblName.centerYAnchor.constraint(equalTo: imageAvatar.centerYAnchor),
            lblName.leadingAnchor.constraint(equalTo: imageAvatar.trailingAnchor,constant: 5),
            lblName.widthAnchor.constraint(equalToConstant: 120),
            lblName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 5)
        ])
        
    }
    
}
