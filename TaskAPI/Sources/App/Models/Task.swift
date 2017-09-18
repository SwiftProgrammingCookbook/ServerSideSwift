//
//  Task.swift
//  App
//
//  Created by Keith Moon on 18/09/2017.
//

import JSON

class Task: JSONConvertible {
    
    enum Error: Swift.Error {
        case expectedJSONData
    }
    
    var description: String
    var category: String
    
    init(description: String, category: String) {
        self.description = description
        self.category = category
    }
    
    required init(json: JSON) throws {
        
        guard
            let description = json["description"]?.string,
            let category = json["category"]?.string else {
                throw Error.expectedJSONData
        }
        self.description = description
        self.category = category
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("description", description)
        try json.set("category", category)
        return json
    }
}
