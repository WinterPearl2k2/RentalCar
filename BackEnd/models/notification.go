package models

import (
	"github.com/google/uuid"
)

type NotificationUser struct {
	Transaction uuid.UUID   `gorm:"type:uuid;notNull"`
	UserId      uuid.UUID   `gorm:"type:uuid;notNull"`
	User        *User       `gorm:"foreignKey:UserId"`
	CarRentail  *CarRentail `gorm:"foreignKey:Transaction"`
}
