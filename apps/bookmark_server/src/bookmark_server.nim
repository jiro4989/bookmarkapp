import os, strutils

import prologue

import bookmark_serverpkg/api

let port = getEnv("SERVER_PORT").parseInt
let settings = newSettings(debug = true, port = Port(port), secretKey = "sushi")
var app = newApp(settings = settings)
app.addRoute(api.routes, "")
app.run()