import json
import ../../core/models/user

type IQueryService* = tuple
  getUsers: proc(): seq[User]
  postUsers: proc(name, password: string): User
