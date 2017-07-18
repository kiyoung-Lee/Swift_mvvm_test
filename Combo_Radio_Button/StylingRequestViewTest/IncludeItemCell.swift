//
//  IncludeItemCell.swift
//  StylingRequestViewTest
//
//  Created by MAPSSI on 18/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit
import BEMCheckBox

class IncludeItemCell: UICollectionViewCell {
    
	@IBOutlet weak var itemLabel: UILabel!
	
	func bind(string:String){
		itemLabel.text = string
	}
}
