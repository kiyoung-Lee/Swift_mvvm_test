//
//  PopupTableCell.swift
//  StylingRequestViewTest
//
//  Created by MAPSSI on 14/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import Foundation
import UIKit

class PopupTableCell: UITableViewCell{
	
	@IBOutlet weak var radioButton: SSRadioButton!
	@IBOutlet weak var testLabel: UILabel!
	
	func bindView(string:String){
		radioButton.setTitle(string, for: UIControlState.normal)
		
	}
}
