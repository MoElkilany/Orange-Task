//
//  MoviePhotos.swift
//  OrangeTask
//
//  Created by Elkilany on 03/12/2023.
//

import Foundation

struct MoviePhotosModel: Codable {
    let photos: MoviePhotos?
    let stat: String?
}

struct MoviePhotos: Codable {
    let page, pages, perpage, total: Int?
    let photo: [Photo]?
}

struct Photo: Codable {
    let id, owner, secret, server: String?
    let farm: Int?
    let title: String?
    let ispublic, isfriend, isfamily: Int?
}


struct PhotosEntity {
    var server: String
    var farm: Int
    var id: String
    var secret: String
    
    init(photo:Photo) {
        self.server = photo.server ?? ""
        self.farm = photo.farm ?? 0
        self.id = photo.id ?? ""
        self.secret = photo.secret ?? ""
    }
}
