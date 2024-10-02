//
//  repeatingClass.swift
//  Takhawi
//
//  Created by Reham Ayman on 29/03/1446 AH.
//

import UIKit


class RepeatingFunction {
    var timer: Timer?
    var elapsedTime: TimeInterval = 0
    let duration: TimeInterval = 3600 // 1 hour in seconds
    let interval: TimeInterval = 30   // Repeat every 30 seconds
    
    // Function you want to repeat
    @objc func performTask() {
        elapsedTime += interval
        print("Task performed! Elapsed time: \(elapsedTime) seconds")
        
        // Add your task code here
        
        // Check if one hour has passed
        if elapsedTime >= duration {
            stopRepeatingTask() // Stop the timer after one hour
            print("Stopping task after 1 hour.")
        }
    }
    
    // Start repeating the function every 30 seconds for one hour
    func startRepeatingTask() {
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(performTask), userInfo: nil, repeats: true)
    }
    
    // Stop repeating the function
    func stopRepeatingTask() {
        timer?.invalidate()
        timer = nil
    }
}
