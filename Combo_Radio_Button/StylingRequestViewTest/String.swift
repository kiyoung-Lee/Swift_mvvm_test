//
//  String.swift
//  StylingRequestViewTest
//
//  Created by MAPSSI on 19/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

extension String {
	func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = (self as NSString).boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
		return boundingBox.height
	}
	
	func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
		let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
		let boundingBox = (self as NSString).boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
		return boundingBox.width
	}
}
