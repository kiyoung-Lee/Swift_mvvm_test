//
//  SampleView.swift
//  StylingRequestViewTest
//
//  Created by MAPSSI on 19/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class SampleView: UIView {
	
	init() {
		super.init(frame: CGRect.init(x: 0, y: 0, width: 10, height: 10))
		self.backgroundColor = UIColor.blue
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		fatalError("init(coder:) has not been implemented")
	}

}
