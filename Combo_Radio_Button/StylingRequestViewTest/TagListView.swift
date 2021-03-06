//
//  TagListView.swift
//  StylingRequestViewTest
//
//  Created by MAPSSI on 17/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import Foundation
import UIKit

class TagListView:UIScrollView {
	var numberOfRows = 0
	var currentRow = 0
	var tags = [UIView]()
	var containerView:UIView!
	
	var hashtagsOffset:UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
	var rowHeight:CGFloat = 30 //height of rows
	var tagHorizontalPadding:CGFloat = 5.0 // padding between tags horizontally
	var tagVerticalPadding:CGFloat = 5.0 // padding between tags vertically
	var tagCombinedMargin:CGFloat = 6.0 // margin of left and right combined, text in tags are by default centered.
	var labelCornerRadius:CGFloat = 5.0
	var labelBorderWidth:CGFloat = 0.5
	var labelBorderColor:CGColor = UIColor.black.cgColor
	var limitRowNumber = Int.max
	var scrollEnable = false
	override init(frame:CGRect) {
		super.init(frame: frame)
		numberOfRows = Int(frame.height / rowHeight)
		containerView = UIView(frame: self.frame)
		self.addSubview(containerView)
		self.showsVerticalScrollIndicator = false
		self.isScrollEnabled = scrollEnable
	}
	
	override func awakeFromNib() {
		numberOfRows = Int(self.frame.height / rowHeight)
		containerView = UIView(frame: self.frame)
		self.addSubview(containerView)
		self.showsVerticalScrollIndicator = false
		self.isScrollEnabled = scrollEnable
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		self.layoutTagsFromIndex(0)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func addTag(_ text:String, target:AnyObject, tapAction:Selector?, longPressAction:Selector? ,backgroundColor:UIColor,textColor:UIColor, font : UIFont) {
		
		guard currentRow >= limitRowNumber else {
			//instantiate label
			//you can customize your label here! but make sure everything fit. Default row height is 30.
			
			let selectItemView: SelectItemView = SelectItemView.instanceFromNib() as! SelectItemView
			selectItemView.layer.cornerRadius = labelCornerRadius
			selectItemView.layer.borderColor = labelBorderColor
			selectItemView.layer.borderWidth = labelBorderWidth
			selectItemView.clipsToBounds = true
			selectItemView.label?.textColor = UIColor.white
			selectItemView.backgroundColor = backgroundColor
			selectItemView.label?.text = text
			selectItemView.label?.textColor = textColor
			selectItemView.label?.font = font
			selectItemView.label.sizeToFit()
			selectItemView.label.adjustsFontSizeToFitWidth = true
			selectItemView.label.textAlignment = .center
			selectItemView.sizeToFit()
			selectItemView.label?.textAlignment = NSTextAlignment.center
			
			
			
			self.tags.append(selectItemView)
			
			//process actions
			if tapAction != nil {
				let tap = UITapGestureRecognizer(target: target, action: tapAction!)
				selectItemView.isUserInteractionEnabled = true
				selectItemView.addGestureRecognizer(tap)
				
			}
			
			if longPressAction != nil {
				let longPress = UILongPressGestureRecognizer(target: target, action: longPressAction!)
				selectItemView.addGestureRecognizer(longPress)
			}
			
			//calculate frame
			selectItemView.frame = CGRect(x: selectItemView.frame.origin.x, y: selectItemView.frame.origin.y , width: selectItemView.label.frame.width + selectItemView.cancelButton.frame.width + 10 , height: rowHeight - tagVerticalPadding)
			
			selectItemView.cancelButton.frame = CGRect(x: selectItemView.label.frame.maxX , y: selectItemView.frame.minY - 1, width: 20, height: rowHeight - tagVerticalPadding)
			
			selectItemView.layer.borderColor = UIColor.black.cgColor
			selectItemView.layer.borderWidth = 0.5
			if self.tags.count == 0 {
				selectItemView.frame = CGRect(x: hashtagsOffset.left, y: hashtagsOffset.top, width: selectItemView.frame.width, height: selectItemView.frame.height)
				self.addSubview(selectItemView)
			}else {
				
				selectItemView.frame = self.generateFrameAtIndex(tags.count-1, rowNumber: &currentRow)
				
				if currentRow < limitRowNumber {
					
//					selectItemView.frame = self.frame
					self.addSubview(selectItemView)
					selectItemView.tag = tags.count
				}
				
			}
			return
		}
	}
	
	
	fileprivate func isOutofBounds(_ newPoint:CGPoint,labelFrame:CGRect) {
		let bottomYLimit = newPoint.y + labelFrame.height
		if bottomYLimit > self.contentSize.height {
			self.containerView.frame = CGRect(x: self.containerView.frame.origin.x, y: self.containerView.frame.origin.y, width: self.containerView.frame.width, height: self.containerView.frame.height + rowHeight - tagVerticalPadding)
			self.contentSize = CGSize(width: self.contentSize.width, height: self.contentSize.height + rowHeight - tagVerticalPadding)
		}
	}
	
	func getNextPosition() -> CGPoint {
		return getPositionForIndex(tags.count-1, rowNumber: self.currentRow)
	}
	
	func getPositionForIndex(_ index:Int,rowNumber:Int) -> CGPoint {
		if index == 0 {
			return CGPoint(x: hashtagsOffset.left, y: hashtagsOffset.top)
		}
		let y = CGFloat(rowNumber) * self.rowHeight + hashtagsOffset.top
		let lastTagFrame = tags[index-1].frame
		let x = lastTagFrame.origin.x + lastTagFrame.width + tagHorizontalPadding
		return CGPoint(x: x, y: y)
	}
	
	func reset() {
		for tag in tags {
			tag.removeFromSuperview()
		}
		tags = []
		currentRow = 0
		numberOfRows = 0
	}
	
	func removeTagWithName(_ name:String) {
		for (index,tag) in tags.enumerated() {
//			if tag.label.text! == name {
//				removeTagWithIndex(index)
//			}
		}
	}
	
	func removeTagWithIndex(_ index:Int) {
		if index > tags.count - 1 {
			print("ERROR: Tag Index \(index) Out of Bounds")
			return
		}
		tags[index].removeFromSuperview()
		tags.remove(at: index)
		layoutTagsFromIndex(index)
	}
	
	fileprivate func getRowNumber(_ index:Int) -> Int {
		return Int((tags[index].frame.origin.y - hashtagsOffset.top)/rowHeight)
	}
	
	fileprivate func layoutTagsFromIndex(_ index:Int,animated:Bool = true) {
		if tags.count == 0 {
			return
		}
		let animation:()->() = {
			var rowNumber = self.getRowNumber(index)
			for i in index...self.tags.count - 1 {
				self.tags[i].frame = self.generateFrameAtIndex(i, rowNumber: &rowNumber)
			}
		}
		UIView.animate(withDuration: 0.3, animations: animation)
		
	}
	
	fileprivate func generateFrameAtIndex(_ index:Int, rowNumber: inout Int) -> CGRect {
		var newPoint = self.getPositionForIndex(index, rowNumber: rowNumber)
		if (newPoint.x + self.tags[index].frame.width) >= self.frame.width {
			rowNumber += 1
			newPoint = CGPoint(x: self.hashtagsOffset.left, y: CGFloat(rowNumber) * rowHeight + self.hashtagsOffset.top)
		}
		self.isOutofBounds(newPoint,labelFrame: self.tags[index].frame)
		return CGRect(x: newPoint.x, y: newPoint.y, width: self.tags[index].frame.width, height: self.tags[index].frame.height)
	}
	
	func removeMultipleTagsWithIndices(_ indexSet:Set<Int>) {
		let sortedArray = Array(indexSet).sorted()
		for index in sortedArray {
			if index > tags.count - 1 {
				print("ERROR: Tag Index \(index) Out of Bounds")
				continue
			}
			tags[index].removeFromSuperview()
			tags.remove(at: index)
			
		}
		layoutTagsFromIndex(sortedArray.first!)
	}
	
}
