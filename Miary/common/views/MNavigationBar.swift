//
//  MNavigationBar.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/08.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit

protocol MNavigationBarDelegate: class {
    func didTapFirstButton()
    func didTapSecondButton()
}

class MNavigationBar: UIView {
    
    static let viewID = "MNavigationBar"

    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    weak var delegate: MNavigationBarDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    private func initialize() {
        let view = Bundle.main.loadNibNamed(MNavigationBar.viewID, owner: self, options: nil)![0] as! UIView
        view.frame = self.bounds
        
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        
        firstButton.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        firstButton.contentVerticalAlignment = .fill
        firstButton.contentHorizontalAlignment = .fill
        secondButton.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        secondButton.contentVerticalAlignment = .fill
        secondButton.contentHorizontalAlignment = .fill
        self.addSubview(view)
    }
    
    @IBAction func didTapFirstButton(_ sender: Any) {
        delegate?.didTapFirstButton()
    }
    
    @IBAction func didTapSecondButton(_ sender: Any) {
        delegate?.didTapSecondButton()
    }
}


