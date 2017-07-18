//
//  SelectItemView.swift
//  StylingRequestViewTest
//
//  Created by MAPSSI on 18/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class SelectItemView: UIView {

	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var cancelButton: UIButton!
	
	
	class func instanceFromNib() -> UIView {
		return UINib(nibName: "SelectItemView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
	}
}
