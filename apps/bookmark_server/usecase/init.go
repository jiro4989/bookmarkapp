package usecase

import (
	"database/sql"

	"github.com/jiro4989/bookmarkapp/apps/bookmark_server/db"
)

var DB *sql.DB

func init() {
	DB = db.DB
}
