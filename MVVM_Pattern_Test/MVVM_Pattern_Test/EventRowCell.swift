//
//  EventRowCell.swift
//  MVVM_Pattern_Test
//
//  Created by MAPSSI on 12/07/2017.
//  Copyright © 2017 MAPSSI. All rights reserved.
//


import UIKit

public class EventRowCell:UITableViewCell {
	
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var contentsLabel: UILabel!
	
	func bindView(viewModel: EventDataModel){
		
		contentsLabel.text = viewModel.banner_title
		dateLabel.text = viewModel.banner_start_date
	}
}
