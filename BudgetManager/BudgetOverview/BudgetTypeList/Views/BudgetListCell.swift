//
//  BudgetListCell.swift
//  BudgetManager
//
//  Created by Sukhaman Singh on 4/16/24.
//

import UIKit

class BudgetListCell: UITableViewCell {
    
    static let reuseID = "BudgetListCell"
    let lblName = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.isUserInteractionEnabled = false
        self.backgroundColor = .clear
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        self.selectedBackgroundView = backgroundView
        addSubview(lblName)
        lblName.translatesAutoresizingMaskIntoConstraints = false
        
        self.lblName.textColor = .white
        self.lblName.textAlignment = .center
        self.lblName.font = .systemFont(ofSize: 16, weight: .regular)
        
        self.lblName.topAnchor.constraint(equalTo: self.topAnchor, constant: 6).isActive = true
        self.lblName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6).isActive = true
        self.lblName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6).isActive = true
        self.lblName.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -6).isActive = true
        
       
    }
    
    
    func updateUIWithDate(_ budgetCategory: BudgetCategory) {
        lblName.text = budgetCategory.category
    }
}
