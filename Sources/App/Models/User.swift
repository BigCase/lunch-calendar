//
//  User.swift
//  LunchCalendar
//
//  Created by BigCase on 10/30/16.
//
//

import Vapor
import Fluent
import Auth
import Foundation

final class User: Model {
    var id: Node?
    var name: String
    
    init (name: String) {
        self.id = UUID().uuidString.makeNode()
        self.name = name
    }
    
    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        name = try node.extract("name")
    }

    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "name": name
        ])
    }
}

extension User: Auth.User {
    static func authenticate(credentials: Credentials) throws -> Auth.User {
        return User(name: "Casey")
    }
    
    static func register(credentials: Credentials) throws -> Auth.User {
        return User(name: "Casey")
    }
}

extension User {
    /**
     This will automatically fetch from database, using example here to load
     automatically for example. Remove on real models.
     */
    public convenience init?(with name: String) throws {
        self.init(name: name)
    }
}

extension User: Preparation {
    static func prepare(_ database: Database) throws {
        //
    }
    
    static func revert(_ database: Database) throws {
        //
    }
}
