//
//  IncludeHeaderView.swift
//  StylingRequestViewTest
//
//  Created by MAPSSI on 18/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class IncludeHeaderView: UIView{

	let itemList:[String] = ["cell", "dj", "helo", "shoowa"]
	

}

extension IncludeHeaderView: UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return itemList.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:IncludeHeaderCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "default", for: indexPath) as! IncludeHeaderCell
		return cell!
	}
}

extension IncludeHeaderView: UICollectionViewDelegate{
	
}
