package model

import "time"

type User struct {
	ID        string
	Name      string
	Password  string
	CreatedAt *time.Time
	UpdatedAt *time.Time
	DeletedAt *time.Time
}
