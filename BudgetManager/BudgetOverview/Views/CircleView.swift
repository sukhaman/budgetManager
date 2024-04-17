//
//  Created by Sukhaman Singh on 3/23/24.
//

import UIKit

class CircleView: UIView {
    var budgetTypes: [Budget] = []
    let distanceFromEdge: CGFloat = 10
    private var timer: Timer?
    private var currentProgress: CGFloat = 0
    private var totalPoints: CGFloat = 0
    var labelAmount: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var labelDate: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        draw(frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        backgroundColor = .clear
        guard let context = UIGraphicsGetCurrentContext() else { return }

        // Define the center and radius of the circle
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - distanceFromEdge
        // Define the start angle
        var startAngle: CGFloat = -.pi / 2
        let circumference = 2 * CGFloat.pi * radius
        // Calculate total points
        totalPoints = CGFloat(budgetTypes.reduce(0) { $0 + $1.estimated })
        // Draw arcs for each budget
        let arrangedList = budgetTypes.sorted{$0.estimated > $1.estimated }
        for  budget in arrangedList {
            // Calculate the desired length for the budget's segment
            let desiredLength = (CGFloat(budget.estimated) / totalPoints) * circumference
        // Calculate the end angle based on the desired length
            let endAngle = startAngle + (desiredLength / radius)
            // Set stroke color
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
            context.setStrokeColor(color.cgColor)
            context.setLineWidth(5) // Adjust width as needed

            // Create arc path
            let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

            // Add arc to context and stroke
                context.addPath(path.cgPath)
                context.strokePath()

                // Update start angle for the next budget, adding gap angle
                startAngle = endAngle
                        
        }
        
        
        self.addSubview(labelAmount)
        
        self.addSubview(labelDate)
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let todayDate = dateFormatter.string(from: date)
        labelDate.text = todayDate
        calculateSpending(budgetTypes)
        NSLayoutConstraint.activate([
            labelAmount.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelAmount.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: -20),
            labelAmount.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            labelAmount.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelDate.topAnchor.constraint(equalTo: self.labelAmount.bottomAnchor,constant: 10),
            labelDate.heightAnchor.constraint(equalToConstant: 30),
            labelDate.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            labelDate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func calculateSpending(_ types: [Budget]) {
        var spentAmount = 0
        
        for type in types {
            spentAmount = spentAmount + Int(type.actual)
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let formattedNumber = numberFormatter.string(from: NSNumber(value:spentAmount)) {
           labelAmount.text = "$ \(formattedNumber)"
        }
        
    }
}

