import json
# framework
import basolato/controller
import basolato/core/base
# view
#import ../views/pages/welcome_view
import ../../di_container

proc getUsers*(request: Request, params: Params): Future[Response] {.async.} =
  let users = di.queryService.getUsers()
  return render(%* users)

proc postUsers*(request: Request, params: Params): Future[Response] {.async.} =
  let
    name = params.getStr("name")
    password = params.getStr("password")

  let user = di.queryService.postUsers(name, password)
  return render(%* user)
