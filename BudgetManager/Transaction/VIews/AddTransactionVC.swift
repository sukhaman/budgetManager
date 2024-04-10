//
//  Created by Sukhaman Singh on 4/9/24.
//

import UIKit

class AddTransactionVC: UIViewController {
    
    let scrollView: UIScrollView = {
     let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    let contentView: UIView = {
     let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let buttonBack: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Back"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Transaction"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BudgetManagerColors.primaryGreen.color
        configureViewController()
    }
    
    private func configureViewController() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerView)
        headerView.addSubview(buttonBack)
        headerView.addSubview(labelTitle)
        

        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
        // Header view constraints
            headerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 80),
            
            buttonBack.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            buttonBack.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            buttonBack.widthAnchor.constraint(equalToConstant: 30),
            buttonBack.heightAnchor.constraint(equalToConstant: 30),
            
            labelTitle.leadingAnchor.constraint(equalTo: buttonBack.trailingAnchor, constant: 20),
            labelTitle.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            labelTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            labelTitle.heightAnchor.constraint(equalToConstant: 30),
            
           
            contentView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
}
