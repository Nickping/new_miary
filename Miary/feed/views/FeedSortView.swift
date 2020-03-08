//
//  FeedSortView.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/08.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit

enum FeedSortType {
    case year, month, days, all
}

protocol FeedSortViewDelegate: class {
    func didTapFeedSortView(for type: FeedSortType)
}

class FeedSortView: UIView {

    @IBOutlet weak var highLightView: UIView!
    
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var allSortBtn: UIButton!
    @IBOutlet weak var daySortBtn: UIButton!
    @IBOutlet weak var monthSortView: UIButton!
    @IBOutlet weak var yearSortBtn: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    static let viewID = "FeedSortView"
    
    weak var delegate: FeedSortViewDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    private func initialize() {
        let view = Bundle.main.loadNibNamed(FeedSortView.viewID, owner: self, options: nil)![0] as! UIView
        view.frame = self.bounds
        
        
        yearSortBtn.layer.cornerRadius = stackView.frame.height / 8
        monthSortView.layer.cornerRadius = stackView.frame.height / 8
        daySortBtn.layer.cornerRadius = stackView.frame.height / 8
        allSortBtn.layer.cornerRadius = stackView.frame.height / 8
        
        wrapperView.layer.cornerRadius = stackView.frame.height / 8
        highLightView.layer.cornerRadius = stackView.frame.height / 8
        addSubview(view)
    }
    
    @IBAction func didTapSortYearBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            self.highLightView.center = self.yearSortBtn.center
        }
    }
    
    @IBAction func didTapSortMonthBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            self.highLightView.center = self.monthSortView.center
        }
    }
    
    @IBAction func didTapSortDayBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            self.highLightView.center = self.daySortBtn.center
        }
    }
    
    @IBAction func didTapSortAllBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            self.highLightView.center = self.allSortBtn.center
        }
    }
}
