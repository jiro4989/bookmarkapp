import db_mysql

import ./models
import ./configs

let connection = config.dbHost & $config.dbPort
let db = open(connection, config.dbUser, config.dbPassword, config.dbDatabase)

proc getUsers*(): seq[User] =
  for row in db.fastRows(sql"SELECT id, email, name, created_at, updated_at FROM user"):
    let u = User(
      id: row[0],
      email: row[1],
      name: row[2],
    )
    result.add u

proc saveUser*(user: User) =
  if user.id == "": return
  db.exec(sql"INSERT INTO user (id, email, name) VALUES (?, ?, ?)", user.id, user.email, user.name)
