import prologue

proc healthCheck*(ctx: Context) {.async.} =
  resp jsonResponse(%* "OK")

let routes* = @[
  pattern("/healthz", healthCheck)
]