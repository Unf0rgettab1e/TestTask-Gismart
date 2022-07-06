//
//  OfferScreenViewController.swift
//  TestTask-Gismart
//
//  Created by Tony on 1.07.22.
//

import UIKit

class OfferScreenViewController: UIViewController {

    @IBOutlet weak var activateOfferButton: UIButton!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    
    var timer: Timer?
    var secondsToEndOffer : Double = 0
    var countdownTime : Countdown = (0, 0, 0, 0)
    var tempCountdownTime : Countdown = (0, 0, 0, 0)
    var isActive = true
    var endOffer : TimeInterval?
    var stopTimeIntervar : Double = 0
    var date = Date()
    
    lazy var gradientForButton: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [#colorLiteral(red: 0.3237385154, green: 0.3569169641, blue: 0.6614339948, alpha: 1).cgColor, #colorLiteral(red: 0.9435318112, green: 0.3996116817, blue: 0.781147778, alpha: 1).cgColor]
        gradient.locations = [0, 1]
        return gradient
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientSetup()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        guard let endOffer = OfferManager.getOfferInfo().endOffer else {
            print("No date known...")
            return
        }
        self.endOffer = endOffer
        
        tempCountdownTime = OfferManager.getCountdownTime(from: self.endOffer! - Date().timeIntervalSince1970)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toPopupSegue" else {
            return}
        guard let destination = segue.destination as? PopupViewController else {
            return}
        let test = OfferManager.getCountdownTimeForLabel(from: countdownTime)
        destination.timeActivatedText = "Offer activated at " + test
        self.timer?.invalidate()
    }

    @IBAction func touchActivateButton(_ sender: Any) {

    }
    
    func gradientSetup(){
        gradientForButton.frame = activateOfferButton.bounds
        gradientForButton.cornerRadius = 12
        activateOfferButton.layer.insertSublayer(gradientForButton, at: 0)
        gradientForButton.shadowColor = #colorLiteral(red: 0.9435318112, green: 0.3996116817, blue: 0.781147778, alpha: 1).cgColor
        gradientForButton.shadowOpacity = 1
        gradientForButton.shadowRadius = 18
        gradientForButton.shadowPath = UIBezierPath(rect: activateOfferButton.bounds).cgPath
        gradientForButton.shadowOffset = .zero
    }
    
    func updateCountdownTimerUI(withCountdownTime countdownTime: Countdown) {
        if tempCountdownTime.hours != countdownTime.hours {
            transitionView(for: self.hoursLabel)
        }
        if tempCountdownTime.minutes != countdownTime.minutes {
            transitionView(for: self.minutesLabel)
        }
        if tempCountdownTime.seconds != countdownTime.seconds {
            transitionView(for: self.secondsLabel)
        }
        tempCountdownTime = countdownTime
        
        daysLabel.text = countdownTime.days.stringWithLeadingZeros
        hoursLabel.text = countdownTime.hours.stringWithLeadingZeros
        minutesLabel.text = countdownTime.minutes.stringWithLeadingZeros
        secondsLabel.text = countdownTime.seconds.stringWithLeadingZeros
    }
    
    func startTimer(){
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in

            let currentTime = Date().timeIntervalSince1970
            self.secondsToEndOffer = self.endOffer! - currentTime + self.stopTimeIntervar

            if  self.secondsToEndOffer < 0 {
                timer.invalidate()
            }

            self.countdownTime = OfferManager.getCountdownTime(from: self.secondsToEndOffer)
            self.updateCountdownTimerUI(withCountdownTime: self.countdownTime)
           
        }
        RunLoop.current.add(timer, forMode: .common)
        self.timer = timer
    }

    func transitionView(for view: UIView){
        UIView.transition(with: view, duration: 0.9, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    
    
    @objc func appMovedToBackground() {
        print("App moved to background!")
        self.timer?.invalidate()
        self.date = Date()
    }
    
    @objc func appMovedToForeground() {
        self.startTimer()
        self.stopTimeIntervar += Date().timeIntervalSince(self.date) + 1
        print("App moved to foreground!")
    }
}

