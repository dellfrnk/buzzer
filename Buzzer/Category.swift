//
//  Category.swift
//  Buzzer/Users/leafranco/Documents/myfiles/Buzzer/Buzzer/Base.lproj/Main.storyboard
//
//  Created by leafranco on 2016-05-04.
//  Copyright © 2016 dfranco. All rights reserved.
//

import Foundation

class Category {
    var id = 0
    var title = ""
    var cluesCount = 0
    //empty dictionary
    var answeredQuestions: [Int: Question] = [:]
    
    init()
    {
        print("hello")
    }
    
    
    class func parseJSON(jsonDictionary: Dictionary<String, AnyObject>) -> Category {
      let category = Category()
      category.id = jsonDictionary["id"] as! Int
      category.title = jsonDictionary["title"] as! String
      category.cluesCount = jsonDictionary["clues_count"] as! Int
      return category
    }
    
    class func loadCategories() throws -> Array<Category> {
         //ofType is extension of the file Caategory
        
        // with comma double f=for if let , shd be not nil
         if let jsonPath = NSBundle.mainBundle().pathForResource("Category", ofType: "json"),
              let jsonData = NSData(contentsOfFile: jsonPath) {
              let json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers)
            
            //  var categories = Array<Category>()
            var categories = [Category]()
            
           if let array = json as? Array<AnyObject> {
               for object in array {
                 if let validObject = object as? Dictionary<String, AnyObject> {
                    let category = Category.parseJSON(validObject)
                          categories.append(category)
                      }
                 }
          }
           return categories
          }
        
        //*NSLocalized for internalization
      throw NSError(domain: "Buzzer!", code: 100, userInfo: [NSLocalizedDescriptionKey: "Found invalid JSON data when looking for file Question.json"])
    }

    
}