import prologue

import ./models
import ./dbs

type ResponseGetUsers* = object
  count*: int
  users*: seq[User]

proc healthCheck*(ctx: Context) {.async.} =
  resp jsonResponse(%* "OK")

proc getUsers*(ctx: Context) {.async.} =
  let users = dbs.getUsers()
  let r = ResponseGetUsers(count: users.len, users: users)
  resp jsonResponse(% r)

proc postUsers*(ctx: Context) {.async.} =
  let users = dbs.getUsers()
  let r = ResponseGetUsers(count: users.len, users: users)
  resp jsonResponse(% r)

let routes* = @[
  pattern("/healthz", healthCheck),
  pattern("/users", getUsers),
]