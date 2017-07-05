//
//  ViewController.swift
//  FlightBooking
//
//  Created by MAPSSI on 05/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var selectDatePicker: UIDatePicker!
	@IBOutlet weak var returnDateButton: UIButton!
	@IBOutlet weak var returnDateLabel: UILabel!
	@IBOutlet weak var departureDateButton: UIButton!
	
	@IBAction func showReturnDateAction(_ sender: Any) {
		
		returnDateLabel.isHidden = !(sender as! UISwitch).isOn
		returnDateButton.isHidden = !(sender as! UISwitch).isOn
	}
	
	@IBAction func showDatePickerAction(_ sender: Any) {
		selectDatePicker.isHidden = false
	}
	
	@IBAction func selectedDateAction(_ sender: Any) {
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		returnDateLabel.isHidden = true
		returnDateButton.isHidden = true
		selectDatePicker.isHidden = true
		
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

