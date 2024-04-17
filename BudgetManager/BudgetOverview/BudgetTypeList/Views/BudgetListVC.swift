//
//  BudgetListVC.swift
//  BudgetManager
//
//  Created by Sukhaman Singh on 4/16/24.
//

import UIKit
import CoreData

class BudgetListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var tableView = UITableView()
    var list = [BudgetCategory]()
    var router: BudgetRouter?
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
       let data = readLocalFile(forName: "BudgetTypes")!
        list = try! JSONDecoder().decode([BudgetCategory].self, from: data)
        self.router = BudgetRouter(navigationController: self.navigationController)
        
    }
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch let error {
            print(error)
        }
        return nil
    }
    
    private func configure() {
        view.backgroundColor = BudgetManagerColors.primaryGreen.color
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.isScrollEnabled = true
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .clear
        self.tableView.allowsMultipleSelection = false
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.register(BudgetListCell.self, forCellReuseIdentifier: BudgetListCell.reuseID)
        
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 10).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 8).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -8).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BudgetListCell.reuseID, for: indexPath) as! BudgetListCell
        let category = list[indexPath.row]
        
        cell.updateUIWithDate(category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = list[indexPath.row].category
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Budget> = Budget.fetchRequest()
        let predicate = NSPredicate(format: "category == %@", category)
        fetchRequest.predicate = predicate
        if let budget = try? context.fetch(fetchRequest).first {
            router?.show(.budgetEdit(budget))
        }

       
    }
}
