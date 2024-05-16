package models

import (
	"github.com/google/uuid"
)

type DeviceToken struct {
	DeviceToken string    `gorm:"type:text"`
	UserId      uuid.UUID `gorm:"type:uuid;notNull"`

	User *User `gorm:"foreignKey:UserId"`
}
