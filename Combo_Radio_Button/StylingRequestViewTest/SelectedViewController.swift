//
//  SelectedViewController.swift
//  StylingRequestViewTest
//
//  Created by MAPSSI on 19/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class SelectedViewController: UIViewController {

	@IBOutlet weak var tempView: UIView!
	
	let headerView:TabNavigationView = TabNavigationView()
	
	let tempList:[String] = ["아우터", "상의", "하의", "가방", "신발", "모자"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
//		tempView.addSubview(headerView)
		view.addSubview(headerView)
		
		headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		headerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		
		for subject in tempList{
			headerView.appendPageTabItem(withTitle: subject)
		}
		
		headerView.navigationDelegate = self
		headerView.animatePageTabSelection(toIndex: 0)

        // Do any additional setup after loading the view.
    }
}

extension SelectedViewController: TabNavigationViewDelegate{
	func didSelect(tabItem: TabItem, atIndex index: Int, completion: (() -> Void)?) {
		completion!()
	}
}
