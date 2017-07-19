//
//  TabItem.swift
//  StylingRequestViewTest
//
//  Created by MAPSSI on 18/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

protocol TabItemDelegate {
	func didSelect(tabItem: TabItem, completion: (() -> Void)?)
}

class TabItem: UIView {

	var delegate: TabItemDelegate?
	
	var title: String = "" {
		didSet {
			titleButton.setTitle(title.uppercased(), for: .normal)
		}
	}
	var titleColor: UIColor = UIColor.white {
		didSet {
			titleButton.setTitleColor(titleColor, for: .normal)
		}
	}
	
	var selectedTitleColor: UIColor = UIColor.white {
		didSet {
			if isSelected {
				titleButton.setTitleColor(selectedTitleColor, for: .normal)
			}
		}
	}
	
	var isSelected: Bool = false {
		didSet {
			if isSelected {
				
			} else {
				
			}
		}
	}
	
	lazy var titleButton: UIButton = {
		let view = UIButton()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.setTitleColor(self.titleColor, for: .normal)
		view.titleLabel?.textAlignment = .center
		view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
		view.addTarget(self, action: #selector(TabItem.didSelect), for: .touchUpInside)
		return view
	}()
	
	var titleLabelWidthAnchor: NSLayoutConstraint?
	
	func setupViews() {
		
		addSubview(titleButton)
		
		titleButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		titleButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
		titleButton.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
		titleButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
	}
	
	func didSelect() {
		if let handler = delegate {
			handler.didSelect(tabItem: self, completion: nil)
		}
	}

}
