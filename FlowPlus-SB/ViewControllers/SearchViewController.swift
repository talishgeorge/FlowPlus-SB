//
//  SearchViewController.swift
//  FlowPlus-SB
//
//  Created by Talish George on 13/12/2023.
//

import UIKit

class SearchViewController: UIViewController {
    var segmentedControl: CustomSegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl = CustomSegmentedControl(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        segmentedControl.layer.cornerRadius = 15
        segmentedControl.backgroundColor = .white
        segmentedControl.clipsToBounds = true
        segmentedControl.setButtonTitles(buttonTitles: ["Option 1", "Option 2"])
        segmentedControl.center = view.center
        view.addSubview(segmentedControl)
    }
}
