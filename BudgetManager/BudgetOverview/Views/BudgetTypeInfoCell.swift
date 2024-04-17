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
            imageAvatar.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            imageAvatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            imageAvatar.widthAnchor.constraint(equalToConstant: 10),
            imageAvatar.heightAnchor.constraint(equalToConstant: 10),
            
            lblName.centerYAnchor.constraint(equalTo: imageAvatar.centerYAnchor),
            lblName.leadingAnchor.constraint(equalTo: imageAvatar.trailingAnchor,constant:5),
            lblName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lblName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    func updateUI(_ budget: Budget) {
        lblName.text = budget.category
        setColorForBudgetType(budget)
    }
    
    private func setColorForBudgetType(_ budget: Budget) {
        
        var color = UIColor.brown
        if budget.category == "Mortgage & Rent" {
            color = BudgetManagerColors.mortgageColor.color
        } else if budget.category == "Auto Insurance" {
            color = BudgetManagerColors.autoInsuranceColor.color
        } else if budget.category == "Gas & Fuel" {
            color = BudgetManagerColors.gasFuelColor.color
        } else if budget.category == "Toll" {
            color = BudgetManagerColors.tolls.color
        } else if budget.category == "Mobile Bills" {
            color = BudgetManagerColors.mobileBillsColor.color
        } else if budget.category == "Utilities Bills" {
            color = BudgetManagerColors.utilitiesColor.color
        } else if budget.category == "Groceries" {
            color = BudgetManagerColors.groceriesColor.color
        } else if budget.category == "Daycare" {
            color = BudgetManagerColors.daycareColor.color
        } else if budget.category == "Financial" {
            color = BudgetManagerColors.lifeInsuranceColor.color
        } else if budget.category == "Eat Outs" {
            color = BudgetManagerColors.eatOutColor.color
        } else if budget.category == "Shopping" {
            color = BudgetManagerColors.shoppingColor.color
        } else if budget.category == "Misc" {
            color = BudgetManagerColors.miscColor.color
        }
        imageAvatar.image = UIImage.from(color: color,size: CGSize(width: 5, height: 5))
    }
    
}
