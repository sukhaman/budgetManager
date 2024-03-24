//
//  Created by Sukhaman Singh on 3/23/24.
//

import UIKit

class CircleView: UIView {
    var budgetLimit: [BudgetType] = []
    let distanceFromEdge: CGFloat = 10
    private var timer: Timer?
    private var currentProgress: CGFloat = 0
    private var totalPoints: CGFloat = 0
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
        totalPoints = CGFloat(budgetLimit.reduce(0) { $0 + $1.limitAmount })
        // Draw arcs for each budget
        let arrangedList = budgetLimit.sorted{$0.limitAmount > $1.limitAmount }
        for  data in arrangedList {
            // Calculate the desired length for the budget's segment
            let desiredLength = (CGFloat(data.limitAmount) / totalPoints) * circumference
        // Calculate the end angle based on the desired length
            let endAngle = startAngle + (desiredLength / radius)
            // Set stroke color
            context.setStrokeColor(data.color.cgColor)
            context.setLineWidth(5) // Adjust width as needed

            // Create arc path
            let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

            // Add arc to context and stroke
                context.addPath(path.cgPath)
                context.strokePath()

                // Update start angle for the next budget, adding gap angle
                startAngle = endAngle
                        
        }
    }
}
