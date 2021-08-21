import prologue

import bookmark_serverpkg/api

let settings = newSettings(debug = true, port = Port(5000), secretKey = "sushi")
var app = newApp(settings = settings)
app.addRoute(api.routes, "")
app.run()