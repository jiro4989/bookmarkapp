package main

import (
	"github.com/jiro4989/bookmarkapp/apps/bookmark_server/api"
	"github.com/jiro4989/bookmarkapp/apps/bookmark_server/db"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	if err := db.InitDB(); err != nil {
		panic(err)
	}

	e := echo.New()

	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	e.GET("/users", api.GetUsers)
	e.POST("/users", api.PostUsers)

	e.Logger.Fatal(e.Start(":5000"))
}
