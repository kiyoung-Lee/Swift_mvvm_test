//
//  EventRowCell.swift
//  MVVM_Pattern_Test
//
//  Created by MAPSSI on 12/07/2017.
//  Copyright © 2017 MAPSSI. All rights reserved.
//


import UIKit
import RxSwift
import RxCocoa

public class EventRowCell:UITableViewCell {
	
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var contentsLabel: UILabel!
	
	private var _binding: Disposable?
	
	var dataContext:EventRowViewModel? = nil {
		didSet{
			
			guard dataContext != nil else {
				dateLabel.text = ""
				contentsLabel.text = ""
				return
			}
			
			let fromModel = dataContext?.propertyChanged.subscribe(onNext: { (PropertyName) in
				switch PropertyName {
					case "banner_start_date":
						self.dateLabel.text = self.dataContext?.banner_start_date
					case "banner_title":
						self.contentsLabel.text = self.dataContext?.banner_title
					default:
						break
				}
			})
			
			_binding = CompositeDisposable(disposables: [fromModel!])
			
			dateLabel.text = dataContext?.banner_start_date
			contentsLabel.text = dataContext?.banner_title
		}
	}
	
	
}
