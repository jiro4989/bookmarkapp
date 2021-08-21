import times

import uuids

type
  User* = object
    id*: string
    email*: string
    password*: string
    name*: string
    createdAt*: Time
    updatedAt*: Time
    deletedAt*: Time

proc newUser*(email, password, name: string, id = ""): User =
  var id = id
  if id == "":
    id = $genUUID()
  result.id = id
  result.email = email
  result.password = password
  result.name = name