//
//  BookManager.swift
//  BookManager
//
//  Created by MAPSSI on 04/07/2017.
//  Copyright © 2017 MAPSSI. All rights reserved.
//

import Foundation

class BookManager{
	var bookList = [Book]()	//mutable Array
	
	
	func addBook(_ bookObject:Book){
		bookList += [bookObject]
	}
	
	func showAllBook() -> String {
		var strTemp = ""
		for book in bookList{
			strTemp += "Name : \(book.name)\n"
			strTemp += "Genre : \(book.genre)\n"
			strTemp += "Author : \(book.author)\n"
			strTemp += "---------------------\n"
		}
		return strTemp
	}
	
	func countBook() -> Int {
		return bookList.count		
	}
	
	func findBook(_ bookname:String) -> String? {
		var strTemp = ""
		for book in bookList{
			if book.name == bookname {
				strTemp += "Name : \(book.name)\n"
				strTemp += "Genre : \(book.genre)\n"
				strTemp += "Author : \(book.author)\n"
				return strTemp
			}
		}
		
		return nil
	}
	
	func removeBook(_ bookName:String) -> Bool {
		for book in bookList{
			if book.name == bookName {
				let index = (bookList as NSArray).index(of: book)
				bookList.remove(at: index)
				return true
			}
		}
		return false
	}
}
