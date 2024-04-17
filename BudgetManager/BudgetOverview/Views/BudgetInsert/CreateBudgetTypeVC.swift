//
//  Created by Sukhaman Singh on 3/24/24.
//

import UIKit
import CoreData

class CreateBudgetTypeVC: UIViewController, UITextFieldDelegate {
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
    var budgetType: Budget?
    var limitAmount: Double = 0
    var budgetCreateTitle = "Create"
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        navigationController?.setNavigationBarHidden(false, animated: false)
        if let navigationController {
            self.router = BudgetRouter(navigationController: navigationController)
        }
        assignData()
        setNavigationItems()
        fetchBudget()
    }
    
    @objc func btnBackTapped() {
        self.router?.back()
    }
    
    @objc func btnCreateTapped() {
        saveBudget()
    }
    
    private func assignData() {
        if let budgetType {
            labelBudgetTypeTitle.text = "\(budgetType.category ?? "") budget"
            labelBudgetDescription.text =  "We'll set a budget of $\(budgetType.estimated) each month for \(budgetType.category ?? "") that starts over at the beginning of every month."
            limitAmount = budgetType.estimated
            textField.text = "$\(limitAmount)"
            budgetCreateTitle = budgetType.estimated == 0 ? "Add" : "Edit"
            
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
        textField.delegate = self
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
            self.budgetType?.estimated = self.limitAmount
        }
        
        buttonMinus.addAction {
            self.limitAmount -= 1
            self.textField.text = "$\(self.limitAmount)"
            self.budgetType?.estimated = self.limitAmount
        }
        
    }
    
    func saveBudget() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Budget> = Budget.fetchRequest()
        
        do {
            // Execute the fetch request to get an array of Transaction objects
            let budgets = try context.fetch(fetchRequest)
            let budget = Budget(context: context)
            budget.category = budgetType?.category
            budget.actual = Double(budgetType?.actual ?? 0)
            budget.estimated = Double(budgetType?.estimated ?? 0)
           try  context.save()
            self.navigationController?.popToRootViewController(animated: true)
        } catch {
            
        }

    }
    
    func fetchBudget() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Budget> = Budget.fetchRequest()
        
        do {
            // Execute the fetch request to get an array of Transaction objects
            let budgets = try context.fetch(fetchRequest)
            var totalBudgetAmount: Double = 0
            var totalSpentAmount: Double = 0
            for budget in budgets {
                totalBudgetAmount += budget.estimated
                totalSpentAmount += budget.actual
            }
            print("Budget limit is set for \(totalBudgetAmount) and already spent money \(totalSpentAmount)")
           try  context.save()
        } catch {
            
        }

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.textField {
            guard let text = textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.text = newString
            self.limitAmount = Double(newString.replacingOccurrences(of: "$", with: "")) ?? 0
            self.budgetType?.estimated = self.limitAmount
            return false
        } else {
            return true
        }
    }
}
