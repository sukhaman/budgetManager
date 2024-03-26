//
//  Created by Sukhaman Singh on 3/24/24.
//

import UIKit

class CreateBudgetTypeVC: UIViewController {
    var labelBudgetTypeTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var textField: UITextField = {
       let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    var labelBudgetDescription: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var router: BudgetRouter?
    var budgetType: BudgetType?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        if let navigationController {
            self.router = BudgetRouter(navigationController: navigationController)
        }
        assignData()
        let btnBack = UIBarButtonItem(image: UIImage(named: "Back"), style: .plain, target: self, action: #selector(btnBackTapped))
        btnBack.tintColor = .white
        self.navigationItem.leftBarButtonItem  = btnBack
        
        let btnEdit = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(btnCreateTapped))
        btnEdit.tintColor = .white
        self.navigationItem.rightBarButtonItem  = btnEdit
    }
    
    @objc func btnBackTapped() {
        self.router?.back()
    }
    
    @objc func btnCreateTapped() {
        
    }
    
    private func assignData() {
        if let budgetType {
            labelBudgetTypeTitle.text = "\(budgetType.type) budget"
            labelBudgetDescription.text =  "We'll set a budget of $\(budgetType.limitAmount) each month for \(budgetType.type) that starts over at the beginning of every month."
            textField.text = "$\(budgetType.limitAmount)"
            
        }
    }
    
    private func configureViewController() {
        view.backgroundColor = BudgetManagerColors.primaryGreen.color
        
        view.addSubview(labelBudgetTypeTitle)
        
        view.addSubview(textField)
        view.addSubview(labelBudgetDescription)
        
        NSLayoutConstraint.activate([
            labelBudgetTypeTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            labelBudgetTypeTitle.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelBudgetTypeTitle.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelBudgetTypeTitle.heightAnchor.constraint(equalToConstant: 30),
            
            textField.topAnchor.constraint(equalTo: self.labelBudgetTypeTitle.bottomAnchor,constant: 20),
            textField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            labelBudgetDescription.topAnchor.constraint(equalTo: self.textField.bottomAnchor,constant: 20),
            labelBudgetDescription.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelBudgetDescription.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelBudgetDescription.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
