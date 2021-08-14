import times
import os

import uuids

type User* = object
  id*: string
  email*: string
  password*: string
  name*: string
  created_at*: Time
  updated_at*: Time
  deleted_at*: Time

proc newUser*(name, password: string, id = ""): User =
  let now = now()
  var id = id
  if id == "":
    id = $genUUID()

  let salt = getEnv("SALT")
  # FIXME: bcrypt使おうとしたら外部依存が発生してエラーになったので一旦コメントアウト
  #let hashedPassword = hash(password, salt)
  let hashedPassword = password

  result = User(
    id: id,
    name: name,
    password: hashedPassword,
    # created_at: now,
    # updated_at: now,
  )
