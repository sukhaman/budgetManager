//
//  Created by Sukhaman Singh on 3/25/24.
//

import XCTest
@testable import BudgetManager
import CoreData

class CreateBudgetTypeSnapshotTests: XCTestCase {
    
    func test_createBudgetTypeVC_iPhoneDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        assert(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "CREATE_BUDGET_IPHONE")
    }
    
    func test_createBudgetTypeVC_iPadDevice() {
        let sut = makeSUT()
        sut.loadViewIfNeeded()
        assert(snapshot: sut.snapshot(for: .iPad(style: .light)), named: "CREATE_BUDGET_iPAD")
    }
    
    // MARK: Helpers
    
    private func makeSUT() -> CreateBudgetTypeVC {
        let viewControler = CreateBudgetTypeVC()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Budget> = Budget.fetchRequest()
        let budget = Budget(context: context)
        budget.category = "Mortgage & Rent"
        budget.actual = Double(0)
        budget.estimated = Double(2300)
        viewControler.budgetType = budget
        return viewControler
    }
}
