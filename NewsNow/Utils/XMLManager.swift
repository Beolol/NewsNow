//
//  XMLManager.swift
//  NewsNow
//
//  Created by Tim on 23/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation

class XMLParserManager: NSObject {
    
    static var shared = XMLParserManager()
    
    var xmlParser: XMLParser
    
    private override init() {
        
        xmlParser = XMLParser()
        super.init()
        
        xmlParser.delegate = self
    }
}

extension XMLParserManager: XMLParserDelegate {

}
