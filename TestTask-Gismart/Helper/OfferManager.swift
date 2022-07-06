//
//  OfferManager.swift
//  TestTask-Gismart
//
//  Created by Tony on 4.07.22.
//

import Foundation


public typealias Countdown = (days: Int, hours: Int, minutes: Int, seconds: Int)

class OfferManager {
    
    static var shared = OfferManager()
    
    static func getOfferInfo() -> Offer {
        return Offer(endOffer: Date().timeIntervalSince1970 + 24 * 60 * 60)
    }
    
    static func getCountdownTime(from secondsUntilEvent: Double) -> Countdown {
        let days = Int(secondsUntilEvent / 86400)
        let hours = Int(secondsUntilEvent.truncatingRemainder(dividingBy: 86400) / 3600)
        let minutes = Int(secondsUntilEvent.truncatingRemainder(dividingBy: 3600) / 60)
        let seconds = Int(secondsUntilEvent.truncatingRemainder(dividingBy: 60))
        return (days, hours, minutes, seconds)
    }
    
    static func getCountdownTimeForLabel(from countdownTime: Countdown) -> String {
        var result: String = ""
        if countdownTime.days != 0 {
            result += String(countdownTime.days.stringWithLeadingZeros) + ":"
        }
        if countdownTime.hours != 0 {
            result += String(countdownTime.hours.stringWithLeadingZeros) + ":"
        }
        if countdownTime.minutes != 0 {
            result += String(countdownTime.minutes.stringWithLeadingZeros) + ":"
        }
        if countdownTime.seconds != 0 {
            result += String(countdownTime.seconds.stringWithLeadingZeros)
        }
        return result
        
    }
}
