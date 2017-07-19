//
//  TabNavigationView.swift
//  StylingRequestViewTest
//
//  Created by MAPSSI on 18/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

protocol TabNavigationViewDelegate {
	func didSelect(tabItem: TabItem, atIndex index: Int, completion: (() -> Void)?)
}


class TabNavigationView: UIView {

	var navigationDelegate: TabNavigationViewDelegate?
	var pageTabItems = [TabItem]()
	
	let pageTabHeight: CGFloat = 50
	
	let headerInputHeight: CGFloat = 50
	
	var minHeaderHeight: CGFloat {
		return 20 // status bar
			+ pageTabHeight
	}
	var midHeaderHeight: CGFloat {
		return 20 + 10 // status bar + spacing
			+ headerInputHeight // input 1
			+ pageTabHeight
	}
	var maxHeaderHeight: CGFloat {
		return 20 + 10 // status bar + spacing
			+ 50 // collapse button
			+ 50 + 10 // input 1 + spacing
			+ 50 + 10 // input 2 + spacing
			+ 50 // input 3
			+ 50 // page tabs
	}
	
	
	var titleColor: UIColor = UIColor.white {
		didSet {
			for item in pageTabItems {
				item.titleColor = titleColor
			}
		}
	}
	var selectedTitleColor: UIColor = UIColor.white {
		didSet {
			for item in pageTabItems {
				item.selectedTitleColor = selectedTitleColor
			}
			selectedLineView.backgroundColor = selectedTitleColor
		}
	}
	
	var selectedTabItem: TabItem? {
		didSet {
			pageTabSelected()
		}
	}
	var selectedLineCenterXAnchor: NSLayoutConstraint?
	var selectedLineWidthAnchor: NSLayoutConstraint?
	var selectedLineView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = UIColor.black
		return view
	}()
	
	var backgroundGradientLayer: CAGradientLayer {
		let gradient = CAGradientLayer()
		gradient.startPoint = CGPoint(x: 0, y: 0.5)
		gradient.endPoint = CGPoint(x: 1, y: 0.5)
		gradient.colors = [UIColor.blue.cgColor, UIColor.black.cgColor]
		return gradient
	}
	
	override var bounds: CGRect {
		didSet {
			backgroundGradientLayer.frame = bounds
		}
	}
	
	init() {
//		super.init(frame: CGRect.zero)
		super.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 100))
		
//		backgroundColor = UIColor.brown
		
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
//		fatalError("init(coder:) has not been implemented")
	}

	func setupViews() {
//		showsHorizontalScrollIndicator = false
//		alwaysBounceHorizontal = true
		
		addSubview(selectedLineView)
		
		selectedLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
		// TODO: figure out why using bottomAnchor does not work
		selectedLineView.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
		selectedLineCenterXAnchor = selectedLineView.centerXAnchor.constraint(equalTo: centerXAnchor)
		selectedLineCenterXAnchor?.isActive = true
		selectedLineWidthAnchor = selectedLineView.widthAnchor.constraint(equalTo: widthAnchor)
		selectedLineWidthAnchor?.isActive = true
	}
	
	func appendPageTabItem(withTitle title: String) {
		
		let prevTabItem: TabItem? = pageTabItems.last
		
		let tabItem = TabItem()
		tabItem.translatesAutoresizingMaskIntoConstraints = false
		tabItem.title = title
		tabItem.delegate = self
		
		
		addSubview(tabItem)
		
		tabItem.leftAnchor.constraint(equalTo: prevTabItem != nil ? prevTabItem!.rightAnchor : leftAnchor).isActive = true
		tabItem.topAnchor.constraint(equalTo: topAnchor).isActive = true
		tabItem.heightAnchor.constraint(equalTo: heightAnchor, constant: -2).isActive = true
		let width = tabItem.title.width(withConstrainedHeight: frame.size.height, font: tabItem.titleButton.titleLabel!.font)
		tabItem.widthAnchor.constraint(equalToConstant: ceil(width) + 30).isActive = true
		
		tabItem.titleColor = UIColor.black
		tabItem.setupViews()
		
		pageTabItems.append(tabItem)
	}
}

extension TabNavigationView: TabItemDelegate {
	func didSelect(tabItem: TabItem, completion: (() -> Void)?) {
		if let index = pageTabItems.index(of: tabItem) {
			navigationDelegate?.didSelect(tabItem: tabItem, atIndex: index) {
				
				self.animatePageTabSelection(toIndex: index)
				
				if let handler = completion {
					handler()
				}
			}
		}
	}
	
	func animatePageTabSelection(toIndex index: Int) {
		if index >= 0, index < self.pageTabItems.count {
			selectedTabItem = self.pageTabItems[index]
		}
	}
	
	func pageTabSelected() {
		for item in pageTabItems {
			if item != selectedTabItem {
				item.isSelected = false
			}
		}
		
		selectedTabItem?.isSelected = true
		
		if  selectedTabItem != nil {
			self.layoutIfNeeded()
			UIView.animate(withDuration: 0.2, animations: {
				self.selectedLineCenterXAnchor?.isActive = false
				self.selectedLineCenterXAnchor = self.selectedLineView.centerXAnchor.constraint(equalTo: self.selectedTabItem!.centerXAnchor)
				self.selectedLineCenterXAnchor?.isActive = true
				
				self.selectedLineWidthAnchor?.isActive = false
				self.selectedLineWidthAnchor = self.selectedLineView.widthAnchor.constraint(equalTo: self.selectedTabItem!.widthAnchor, constant: -30)
				self.selectedLineWidthAnchor?.isActive = true
				
				self.layoutIfNeeded()
			})
		}
	}
}
