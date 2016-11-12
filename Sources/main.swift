import Kitura

// Create a new router
let router = Router()

// Handle HTTP GET requests to /
router.get("/api") {
    request, response, next in
    response.send("Hello, Worldzz!!")
    next()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8090, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()

