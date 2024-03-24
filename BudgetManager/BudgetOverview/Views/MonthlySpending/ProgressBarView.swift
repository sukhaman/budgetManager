//
//  Created by Sukhaman Singh on 3/24/24.
//

import UIKit



class ProgressBarView: UIView {
    var budgetAmount: CGFloat = 80 {
        didSet {
            setNeedsDisplay()
        }
    }
    var fillColor: UIColor = BudgetManagerColors.secondaryGreen.color
    var warningColor: UIColor = BudgetManagerColors.primaryYellow.color
    var dangerColor: UIColor = BudgetManagerColors.primaryRed.color
    var totalIncome: CGFloat = 100 {
        didSet {
            setNeedsDisplay()
        }
    }
    var spentAmount: CGFloat = 60 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        self.init()
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let barHeight = rect.height
        let totalWidth = rect.width
        let spentWidth = totalWidth * (spentAmount / totalIncome)
        let budgetWidth = totalWidth * (budgetAmount / totalIncome)
        var progressBarRect = CGRect(x: 0, y: 0, width: rect.width * budgetAmount, height: rect.height)
    
        // Draw total income bar
        context.setFillColor(UIColor.clear.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: totalWidth, height: barHeight))
        if spentAmount <= budgetAmount {
            context.setFillColor(fillColor.cgColor)
            progressBarRect = CGRect(x: 0, y: 0, width: spentWidth, height: barHeight)
        }
        else if spentAmount > totalIncome {
            context.setFillColor(dangerColor.cgColor)
        } else {
            context.setFillColor(warningColor.cgColor)
            progressBarRect = CGRect(x: 0, y: 0, width: spentWidth, height: barHeight)
        }
        
        context.fill(progressBarRect)
    }
}

class BudgetProgressBarView: UIView {
    var budgetAmount: CGFloat = 80 {
        didSet {
            setNeedsDisplay()
        }
    }
    var fillColor: UIColor = BudgetManagerColors.secondaryGreen.color
    var warningColor: UIColor = BudgetManagerColors.primaryYellow.color
    var dangerColor: UIColor = BudgetManagerColors.primaryRed.color
    var spentAmount: CGFloat = 60 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        self.init()
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let barHeight = rect.height
        let totalWidth = rect.width
        let spentWidth = totalWidth * (spentAmount / budgetAmount)
        var progressBarRect = CGRect(x: 0, y: 0, width: rect.width * budgetAmount, height: rect.height)
    
        // Draw total income bar
        context.setFillColor(UIColor.clear.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: totalWidth, height: barHeight))
        if spentAmount <= budgetAmount {
            context.setFillColor(fillColor.cgColor)
            progressBarRect = CGRect(x: 0, y: 0, width: spentWidth, height: barHeight)
        }
        else if spentAmount > budgetAmount {
            context.setFillColor(dangerColor.cgColor)
        } else {
            context.setFillColor(warningColor.cgColor)
            progressBarRect = CGRect(x: 0, y: 0, width: spentWidth, height: barHeight)
        }
        
        context.fill(progressBarRect)
    }
}
