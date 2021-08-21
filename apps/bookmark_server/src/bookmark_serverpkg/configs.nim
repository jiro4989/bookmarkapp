import os

import envconfig

type Config* = object
  serverPort*: int
  dbHost*: string
  dbPort*: int
  dbUser*: string
  dbPassword*: string
  dbDatabase*: string

proc loadConfig(): Config =
  result = getEnvConfig(Config, prefix="BOOKMARK_SERVER")

let config* = loadConfig()