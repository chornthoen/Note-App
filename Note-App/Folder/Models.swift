//
//  Models.swift
//  Note-App
//
//  Created by Chorn Thoen on 5/25/24.
//

import Foundation

//model for Note
struct FolderModels {
    let id : UUID
    var title: String
    var description: String
    var date: Date
    
    init(title: String, description: String, date: Date) {
        self.id = UUID()
        self.title = title
        self.description = description
        self.date = date
    }
}

