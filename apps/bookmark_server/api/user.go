package api

import (
	"net/http"

	"github.com/jiro4989/bookmarkapp/apps/bookmark_server/model"
	"github.com/jiro4989/bookmarkapp/apps/bookmark_server/usecase"
	"github.com/labstack/echo/v4"
)

func GetUsers(c echo.Context) error {
	users, err := usecase.Users()
	if err != nil {
		return err
	}
	return c.JSON(http.StatusOK, users)
}

func PostUsers(c echo.Context) error {
	var p model.User
	if err := c.Bind(&p); err != nil {
		return err
	}
	user, err := usecase.NewUser(p.Name, p.Password)
	if err != nil {
		return err
	}
	return c.JSON(http.StatusOK, user)
}
