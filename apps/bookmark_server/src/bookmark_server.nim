import prologue

import bookmark_serverpkg/apis
import bookmark_serverpkg/configs

let settings = newSettings(debug = true, port = Port(config.serverPort), secretKey = "sushi")
var app = newApp(settings = settings)
app.addRoute(apis.routes, "")
app.run()