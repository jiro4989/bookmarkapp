import json
# framework
import basolato/controller
import basolato/core/base
# view
#import ../views/pages/welcome_view


proc healthz*(request: Request, params: Params): Future[Response] {.async.} =
  return render(%*{"status": "ok"})
