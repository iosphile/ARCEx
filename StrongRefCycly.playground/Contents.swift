//: Playground - noun: a place where people can play

import UIKit

class Author {
    
    var name: String
    var courses = [Course]()
    
    init(name: String) {
        self.name = name
        print("Author \(name) initialised")
    }
    
    deinit {
        print("Author \(name) deinitialised")
    }
}

class Course{
    
    var title: String
    weak var author: Author?
    
    init(title: String, author: Author) {
        self.title = title
        self.author = author
        author.courses.append(self)
        print("title \(title) initialised")

    }
    
    deinit {
        print("title \(title) deinitialised")
    }
}

var author: Author? = Author(name: "Anji")
var course: Course? = Course(title: "devphile",author: author!)

author = nil
course = nil


class Contact {
    
    var name: String
    var phoneNumber: String?
    
    lazy var prettyPrint : () -> String = { [unowned self] in
        var result = self.name
        if let contactNumber = self.phoneNumber {
            result = "name:\t\(result)\nPhone:\t\(contactNumber)"
        }
        
        return result
    }
    
    
    init(name: String, phoneNumber: String? = nil) {
        self.name = name
        self.phoneNumber = phoneNumber
        print("Contact \(name) initialised")
    }
    deinit {
        print("Contact \(name) deinitialised")
    }
    
}

var john: Contact? = Contact(name: "John", phoneNumber: "+1-555-555-555" )
print(john!.prettyPrint())
john = nil

//var doe: Contact? = Contact(name: "Doe", phoneNumber: "+1-555-555-555")
//doe?.prettyPrint()
//doe = nil




