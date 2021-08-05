import json
import sequtils
import allographer/query_builder
import query_service_interface
import ../../core/models/user

import uuids

type QueryService* = ref object

proc newQueryService*(): QueryService =
  return QueryService()

proc getUsers(this: QueryService): seq[User] =
  return rdb().table("user").get().mapIt(it.to(User))

proc postUsers(this: QueryService): User =
  let id = $genUUID()
  #return rdb().table("user").get()

proc toInterface*(this: QueryService): IQueryService =
  return (
    getUsers: proc(): seq[User] = this.getUsers,
    postUsers: proc(): User = this.postUsers,
  )
