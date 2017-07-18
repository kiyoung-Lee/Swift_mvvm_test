//
//  ViewController.swift
//  StylingRequestViewTest
//
//  Created by MAPSSI on 13/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit
import BEMCheckBox

class ViewController: UIViewController {

	@IBOutlet weak var itemView: UIView!
	@IBOutlet weak var checkBox: BEMCheckBox!
	
	
	var tagList: [String] = ["hello", "world", "hifive", "school", "design", "abracadabrasharlrl", "chcola", "shoese"]
	
	var tagListView:TagListView = TagListView(frame: CGRect(x: 9, y: 5, width: 300 , height: 500))

	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.checkBox.boxType = BEMBoxType.square
		
		tagListView.rowHeight = 40
		tagListView.tagHorizontalPadding = 6
		tagListView.tagVerticalPadding = 10
		tagListView.tagCombinedMargin = 25
		tagListView.labelCornerRadius = 14
		tagListView.limitRowNumber = 3
		
		for tag in tagList {
			tagListView.addTag(tag, target: self, tapAction: #selector(touch), longPressAction: nil, backgroundColor: UIColor.white, textColor: UIColor.black, font: UIFont.systemFont(ofSize: 14))
		}
		self.itemView.addSubview(self.tagListView)
		
		//		itemView.isHidden = true

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func touch(){
		
	}

}

