//
//  TestModel.swift
//  testTV
//
//  Created by King on 21/09/2017.
//  Copyright © 2017 GP. All rights reserved.
//

import Foundation
import SwiftyJSON

class TestModel: NSObject {
    
    var api: String
    var auth: String
    var descrip: String
    var https: String
    var link: String
    var section: String
    
    init(api: String, auth: String, description: String, https: String, link: String, section: String) {
        self.api = api
        self.auth = auth
        self.descrip = description
        self.https = https
        self.link = link
        self.section = section
    }
    
    convenience init(json: JSON) {
        let api = json["API"].stringValue
        let auth = json["Auth"].string ?? ""
        let description = json["Description"].stringValue
        let https = json["HTTPS"].boolValue ? "YES" : "NO"
        let link = json["Link"].stringValue
        let section = json["Section"].stringValue
        self.init(api: api, auth: auth, description: description, https: https, link: link, section: section)
    }
    
}
