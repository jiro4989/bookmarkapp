import json
import sequtils
import allographer/query_builder
import query_service_interface
import ../../core/models/user

type QueryService* = ref object

proc newQueryService*(): QueryService =
  return QueryService()

proc getUsers(this: QueryService): seq[User] =
  return rdb().table("user").get().mapIt(it.to(User))

proc postUsers(this: QueryService, name, password: string): User =
  let u = newUser(name, password)
  rdb().table("user").insert(%* u)
  return u

proc toInterface*(this: QueryService): IQueryService =
  return (
    getUsers: proc(): seq[User] = this.getUsers,
    postUsers: proc(name, password: string): User = this.postUsers(name, password),
  )
