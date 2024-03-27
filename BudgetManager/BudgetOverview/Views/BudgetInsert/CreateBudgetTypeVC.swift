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
        textField.borderStyle = .none
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.backgroundColor = .white
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

    var buttonMinus: UIButton = {
       let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = BudgetManagerColors.textFieldBGColor.color
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var buttonPlus: UIButton = {
       let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = BudgetManagerColors.textFieldBGColor.color
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var router: BudgetRouter?
    var budgetType: BudgetType?
    var limitAmount: Int = 0
    var budgetCreateTitle = "Create"
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        if let navigationController {
            self.router = BudgetRouter(navigationController: navigationController)
        }
        assignData()
        setNavigationItems()
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
            limitAmount = budgetType.limitAmount
            textField.text = "$\(limitAmount)"
            budgetCreateTitle = "Edit"
            
        }
    }
    
    fileprivate func setNavigationItems() {
        let btnBack = UIBarButtonItem(image: UIImage(named: "Back"), style: .plain, target: self, action: #selector(btnBackTapped))
        btnBack.tintColor = .white
        self.navigationItem.leftBarButtonItem  = btnBack
        
        let btnEdit = UIBarButtonItem(title: budgetCreateTitle, style: .plain, target: self, action: #selector(btnCreateTapped))
        btnEdit.tintColor = .white
        self.navigationItem.rightBarButtonItem  = btnEdit
    }
    
    private func configureViewController() {
        view.backgroundColor = BudgetManagerColors.primaryGreen.color
        
        view.addSubview(labelBudgetTypeTitle)
        
        view.addSubview(textField)
        textField.addSubview(buttonMinus)
        textField.addSubview(buttonPlus)
        view.addSubview(labelBudgetDescription)
        
        NSLayoutConstraint.activate([
            labelBudgetTypeTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            labelBudgetTypeTitle.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelBudgetTypeTitle.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelBudgetTypeTitle.heightAnchor.constraint(equalToConstant: 30),
            
            textField.topAnchor.constraint(equalTo: self.labelBudgetTypeTitle.bottomAnchor,constant: 20),
            textField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            textField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            buttonMinus.topAnchor.constraint(equalTo: self.textField.topAnchor),
            buttonMinus.leadingAnchor.constraint(equalTo: self.textField.leadingAnchor, constant: 0),
            buttonMinus.widthAnchor.constraint(equalToConstant: 40),
            buttonMinus.heightAnchor.constraint(equalTo: textField.heightAnchor),
            
            buttonPlus.topAnchor.constraint(equalTo: self.textField.topAnchor),
            buttonPlus.trailingAnchor.constraint(equalTo: self.textField.trailingAnchor, constant: -0),
            buttonPlus.widthAnchor.constraint(equalToConstant: 40),
            buttonPlus.heightAnchor.constraint(equalTo: textField.heightAnchor),
            
            labelBudgetDescription.topAnchor.constraint(equalTo: self.textField.bottomAnchor,constant: 20),
            labelBudgetDescription.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            labelBudgetDescription.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            labelBudgetDescription.heightAnchor.constraint(equalToConstant: 50),
        ])
        
      
        buttonPlus.addAction {
            self.limitAmount += 1
            self.textField.text = "$\(self.limitAmount)"
        }
        
        buttonMinus.addAction {
            self.limitAmount -= 1
            self.textField.text = "$\(self.limitAmount)"
        }
        
    }
}
