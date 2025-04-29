//
//  Book.swift
//  LibraryHub_App
//
//  Created by Shreyesh Chennagouni on 4/17/25.
//

import Foundation

class Book {
    var id: String
    var title: String
    var author: String
    var copies: Int
    var imageName: String

    init(id: String, title: String, author: String, copies: Int, imageName: String) {
        self.id = id
        self.title = title
        self.author = author
        self.copies = copies
        self.imageName = imageName
    }
}
