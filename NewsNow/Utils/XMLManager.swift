//
//  XMLManager.swift
//  NewsNow
//
//  Created by Tim on 23/04/2018.
//  Copyright © 2018 timothey.taran. All rights reserved.
//

import Foundation
import SWXMLHash

enum XMLConstants {
    static let imageURLString = "imageUrl"
    static let pubDateString = "pubDate"
    static let header = "title"
    static let description = "description"
    static let link = "link"
    static let item = "item"
}


class XMLParserManager: NSObject {
    
    static var shared = XMLParserManager()
    
    static var currentLink = ""
    
    var xmlData: [[String : String]]?
    var xmlItem: [String : String]?
    var xmlElement: String?
    
    private override init() {
        super.init()
    }
    
    
    func getNews(by urlString: String, completeHandler: @escaping ([[String : String]]) -> Void ) {
        XMLParserManager.currentLink = urlString
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.getXMLData(by: urlString)
            
            DispatchQueue.main.async { [weak self] in
                if let sself = self, let data = sself.xmlData, XMLParserManager.currentLink == urlString {
                    completeHandler(data)
                }
            }
        }
    }
    
    func getXMLData(by urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        clearXMLData()
        let xmlParser = XMLParser(contentsOf: url)
        xmlParser?.delegate = self
        xmlParser?.parse()
    }
    
    private static let inputDateFormatter: DateFormatter = {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.locale = Locale(identifier: "en_POSIX")
        inputDateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        
        return inputDateFormatter
    }()
    
    
    private static let outputDateFormatter: DateFormatter = {

        let outputDateFormatter = DateFormatter()
        outputDateFormatter.locale = Locale(identifier: "ru_RU")
        outputDateFormatter.dateFormat = "dd MMMM yyyy' г.' HH:mm"
        
        return outputDateFormatter
    }()
    
    func clearXMLData() {
        self.xmlData = nil
        self.xmlItem = nil
        self.xmlElement = nil
    }
    
    func formattedDateString(_ string: String?) -> String {
        
        guard let str = string, let data = XMLParserManager.inputDateFormatter.date(from: str) else { return "" }
        let result = XMLParserManager.outputDateFormatter.string(from: data)
        return result
    }
}

extension XMLParserManager: XMLParserDelegate {

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "rss" {
            xmlData = [[String : String]]()
        }
        
        if elementName == "enclosure" {
            xmlItem?[XMLConstants.imageURLString] = attributeDict["url"]
        }
        
        if elementName == XMLConstants.item {
            xmlItem = [String : String]()
        }
        
        xmlElement = nil
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        
//        let encodedData = string.data(using: String.Encoding.utf8)!
//        let attributedString = encodedData.attributedString
//
//
//        guard let appendString = attributedString?.string else { return }
//
//
//        if xmlElement == nil {
//            xmlElement = appendString
//        } else {
//            xmlElement?.append(appendString)
//        }

        let appendString = string
        
        if xmlElement == nil {
            xmlElement = appendString
        } else {
            xmlElement?.append(appendString)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == XMLConstants.header || elementName == XMLConstants.link || elementName == "url" {
            xmlItem?[elementName] = xmlElement
        }
        
        if elementName == XMLConstants.pubDateString {
            let pubDate = formattedDateString(xmlElement)
            xmlItem?[elementName] = pubDate
        }

        if let description = xmlElement, elementName == XMLConstants.description {
            let result = description.trimmingCharacters(in: .whitespacesAndNewlines)
            xmlItem?[elementName] = result
        }

        if elementName == XMLConstants.item {
            if let item = xmlItem {
                xmlData?.append(item)
            }
        }
        
        self.xmlElement = nil;
    }
}
