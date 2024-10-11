//
//  chartBarView.swift
//  Takhawi
//
//  Created by Reham Ayman on 08/04/1446 AH.
//

import UIKit


class BarChartView: UIView {

    // Data source for the bar chart (example values)
    var barValues: [CGFloat] = [50, 100, 150, 75, 125, 90, 200]
    var barLabels: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawBars()
    }

    // Draw the bars
    func drawBars() {
        let context = UIGraphicsGetCurrentContext()
        let barWidth: CGFloat = 30.0
        let spacing: CGFloat = 20.0
        let chartHeight = bounds.height * 0.6
        let maxValue = barValues.max() ?? 1

        for (index, value) in barValues.enumerated() {
            let xPos = CGFloat(index) * (barWidth + spacing) + spacing
            let barHeight = (value / maxValue) * chartHeight
            let yPos = bounds.height - barHeight - 30.0 // Padding from bottom

            // Create the bar rectangle
            let barRect = CGRect(x: xPos, y: yPos, width: barWidth, height: barHeight)
            context?.setFillColor(UIColor(named: "popcolor")?.cgColor ?? UIColor.systemBlue.cgColor)
            context?.fill(barRect)

            // Draw label below the bar
            let label = UILabel(frame: CGRect(x: xPos, y: bounds.height - 20.0, width: barWidth, height: 20))
            label.textAlignment = .center
            label.text = barLabels[index]
            label.font = UIFont.systemFont(ofSize: 10)
            self.addSubview(label)

            // Draw value above the bar
            let valueLabel = UILabel(frame: CGRect(x: xPos, y: yPos - 20.0, width: barWidth, height: 20))
            valueLabel.textAlignment = .center
            valueLabel.text = "\(Int(value))"
            valueLabel.font = UIFont.systemFont(ofSize: 10)
            self.addSubview(valueLabel)
        }
    }
}
