import re
# framework
import basolato
# controller
import app/http/controllers/healthz_controller
# middleware
import app/http/middlewares/auth_middleware
import app/http/middlewares/cors_middleware

var routes = newRoutes()
#routes.middleware(re".*", auth_middleware.checkCsrfTokenMiddleware)
routes.middleware(re".*", cors_middleware.setCorsHeadersMiddleware)

#routes.get("/", welcome_controller.index)

# groups "/api":
#   routes.get("/index", welcome_controller.indexApi)

routes.get("/healthz", healthz)
routes.get("/users", healthz)
routes.get("/users/{id}", healthz)
routes.get("/bookmarks", healthz)
routes.get("/bookmarks/{id}", healthz)

serve(routes)
