//
//  IncludeItemViewController.swift
//  StylingRequestViewTest
//
//  Created by MAPSSI on 18/07/2017.
//  Copyright © 2017 KiyoungLee. All rights reserved.
//

import UIKit

class IncludeItemViewController: UIViewController {

	@IBOutlet weak var popupView: IncludeHeaderView!
	@IBOutlet weak var includeHeaderCollectionView: UICollectionView!
	@IBOutlet weak var includeItemCollectionView: UICollectionView!
	
	
	let itemList:[String] = ["반팔", "니트", "청자켓", "데님", "슬랙스", "아우터", "셔츠", "롤업셔츠", "린넨셔츠"]
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		includeHeaderCollectionView.dataSource = popupView
		includeHeaderCollectionView.delegate = popupView
		includeItemCollectionView.dataSource = self
		includeItemCollectionView.delegate = self
    }
}

extension IncludeItemViewController: UICollectionViewDelegate{
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("select includeItem")
	}
}

extension IncludeItemViewController: UICollectionViewDataSource{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return itemList.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell:IncludeItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "default", for: indexPath) as! IncludeItemCell
		cell.bind(string: itemList[indexPath.row])
		return cell
	}
}
