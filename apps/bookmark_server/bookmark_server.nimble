# Package

version       = "0.1.0"
author        = "jiro4989"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["bookmark_server"]


# Dependencies

requires "nim >= 1.4.8"
requires "prologue >= 0.4.4"
requires "envconfig >= 1.1.0"
requires "uuids >= 0.1.11"