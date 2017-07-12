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
	
	var dataContext:EventRowViewModel? = nil {
		didSet{
			
			guard dataContext != nil else {
				dateLabel.text = ""
				contentsLabel.text = ""
				return
			}
			
			dateLabel.text = dataContext?.banner_start_date
			contentsLabel.text = dataContext?.banner_title
		}
	}
}
