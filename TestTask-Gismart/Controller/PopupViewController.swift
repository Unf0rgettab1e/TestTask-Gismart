//
//  PopupViewController.swift
//  TestTask-Gismart
//
//  Created by Tony on 3.07.22.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var greatLabel: UILabel!
    @IBOutlet weak var closePopupButton: UIView!
    @IBOutlet weak var timeActivatedLabel: UILabel!
    
    var timeActivatedText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        customisePopupView()
        timeActivatedLabel.text = timeActivatedText
        let mainViewTapGesRecog = UITapGestureRecognizer(target: self, action: #selector(closePopupAct))
        
        self.view.addGestureRecognizer(mainViewTapGesRecog)
    }
    
    @objc func closePopupAct(){
        dismiss(animated: true)
    }
    
    func customisePopupView(){
        popupView.layer.cornerRadius = 20
        greatLabel.layer.shadowColor = #colorLiteral(red: 0, green: 0.2503117919, blue: 0.6862050873, alpha: 1).cgColor
        greatLabel.layer.shadowOffset = .zero
        greatLabel.layer.shadowOpacity = 0.5
        greatLabel.layer.shadowRadius = 30
        greatLabel.layer.shadowPath = UIBezierPath(rect: greatLabel.bounds).cgPath
    }

}
