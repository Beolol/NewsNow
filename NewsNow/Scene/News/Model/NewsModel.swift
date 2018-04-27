//
//  NewModel.swift
//  NewsNow
//
//  Created by Tim on 27/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation
struct NewsModel {
    let description: String
    let link: String
    let title: String
    let imageUrl: String
    let pubDate: String
    
    init(xmlItem: [String: String]) {
        description = xmlItem[XMLConstants.description] ?? ""
        link = xmlItem[XMLConstants.link] ?? ""
        title = xmlItem[XMLConstants.header] ?? ""
        imageUrl = xmlItem[XMLConstants.imageURLString] ?? ""
        pubDate = xmlItem[XMLConstants.pubDateString] ?? ""
    }
    
}
