//
//  Photo.swift
//  Phtorama
//
//  Created by dadong on 2017. 7. 31..
//  Copyright © 2017년 dadong. All rights reserved.
//

import UIKit

class Photo {

    let title: String
    let remoteURL: URL
    let photoID: String
    let dateTaken: Date
    
    init(title: String, photoID: String, remoteURL: URL, dateTaken: Date) {
    
        self.title = title
        self.remoteURL = remoteURL
        self.photoID = photoID
        self.dateTaken = dateTaken
    
    }
}


extension Photo: Equatable {
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.photoID == rhs.photoID
    }
}

