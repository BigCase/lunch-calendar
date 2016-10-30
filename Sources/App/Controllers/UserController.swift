import Vapor
import HTTP

final class UserController: ResourceRepresentable {
   func index(request: Request) throws -> ResponseRepresentable {
        return "User index"
    }

    func makeResource() -> Resource<User> {
        return Resource(
            index: index
        )
    }
}

extension Request {
    func user() throws -> User {
        guard let json = json else { throw Abort.badRequest }
        return try User(node: json)
    }
}
