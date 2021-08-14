package usecase

import (
	"github.com/google/uuid"
	"github.com/jiro4989/bookmarkapp/apps/bookmark_server/model"
)

func Users() ([]*model.User, error) {
	rows, err := DB.Query("SELECT id, name FROM user")
	if err != nil {
		return nil, err
	}

	var users []*model.User
	for rows.Next() {
		var u model.User
		if err := rows.Scan(&u.ID, &u.Name); err != nil {
			return nil, err
		}
		users = append(users, &u)
	}
	return users, nil
}

func NewUser(name, password string) (*model.User, error) {
	stmt, err := DB.Prepare("INSERT INTO users (id, name, password) VALUES (?, ?, ?)")
	if err != nil {
		return nil, err
	}

	id := uuid.New().String()
	_, err = stmt.Exec(id, name, password)
	if err != nil {
		return nil, err
	}

	var u model.User
	u.ID = id
	u.Name = name
	u.Password = password

	return &u, nil
}
