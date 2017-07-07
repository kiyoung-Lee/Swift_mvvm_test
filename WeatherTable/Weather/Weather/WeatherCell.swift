//
//  WeatherCell.swift
//  Weather
//
//  Created by MAPSSI on 07/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
	@IBOutlet weak var countryLabel: UILabel!
	@IBOutlet weak var weatherLabel: UILabel!
	@IBOutlet weak var temperatureLabel: UILabel!
	@IBOutlet weak var imgView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
