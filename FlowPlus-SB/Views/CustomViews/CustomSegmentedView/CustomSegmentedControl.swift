//
//  CustomSegmentedControl.swift
//  FlowPlus-SB
//
//  Created by Talish George on 2/2/2024.
//

import UIKit

class CustomSegmentedControl: UIView {
    
    @IBOutlet var contentView: UIView!
    private var buttonTitles: [String]!
    private var buttons: [UIButton] = []
    private var selectorView: UIView!
    var unselectedSegmentColor: UIColor = .lightGray
    var selectedSegmentColor: UIColor = .darkGray
    var unselectedSegmentTitleColor: UIColor = .gray
    var selectedSegmentTitleColor: UIColor = .white
    
    var textColor: UIColor = .lightGray
    var selectorViewColor: UIColor = .darkGray
    var selectorTextColor: UIColor = .white
    
    public private(set) var selectedIndex: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CustomSegmentedControl", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setButtonTitles(buttonTitles: [String]) {
        self.buttonTitles = buttonTitles
        updateView()
    }
    
    func setIndex(index: Int) {
        
        buttons[selectedIndex].backgroundColor = unselectedSegmentColor
        buttons[selectedIndex].setTitleColor(textColor, for: .normal)
        
        buttons[index].backgroundColor = selectedSegmentColor
        buttons[index].setTitleColor(selectorTextColor, for: .normal)
        
        buttons[selectedIndex].setTitleColor(unselectedSegmentTitleColor, for: .normal)
        
        buttons[index].setTitleColor(selectedSegmentTitleColor, for: .normal)
        
        selectedIndex = index
    }
    
    private func updateView() {
        createButton()
        configureSelectorView()
        configureStackView()
    }
    
    private func configureSelectorView() {
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        selectorView = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
    @objc func buttonAction(sender: UIButton) {
        
        for (buttonIndex, btn) in buttons.enumerated() {
                  btn.backgroundColor = unselectedSegmentColor
                  btn.setTitleColor(unselectedSegmentTitleColor, for: .normal)

                  if btn == sender {
                      let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                      UIView.animate(withDuration: 0.3) {
                          self.selectorView.frame.origin.x = selectorStartPosition
                      }
                      btn.backgroundColor = selectedSegmentColor
                      btn.setTitleColor(selectedSegmentTitleColor, for: .normal)
                      selectedIndex = buttonIndex
                  }
              }
        
    }
    
    private func configureStackView() {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
}
