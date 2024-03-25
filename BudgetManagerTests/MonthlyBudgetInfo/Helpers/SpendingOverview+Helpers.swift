//
//  SpendingOverview+Helpers.swift
//  BudgetManagerTests
//
//  Created by Sukhaman Singh on 3/24/24.
//

import UIKit
@testable import BudgetManager


extension SpendingOverviewVC {
    
    func cell(row: Int, section: Int) -> UITableViewCell? {
        guard numberOfRows(in: section) > row else {
            return nil
        }
        let ds = budgetTypeTableView.dataSource
        let index = IndexPath(row: row, section: section)
        return ds?.tableView(budgetTypeTableView, cellForRowAt: index)
    }
    
    func numberOfRows(in section: Int) -> Int {
        budgetTypeTableView.numberOfSections > section ? budgetTypeTableView.numberOfRows(inSection: section) : 0
    }
    
    
}
