import Vapor

let drop = Droplet()

drop.get("/") { request in
    try drop.view.make("base.leaf")
}

drop.get("hello") { request in
    return "Hello, world!"
}

drop.resource("posts", PostController())
drop.resource("users", UserController())

drop.run()
