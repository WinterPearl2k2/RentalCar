package models

import (
	"time"

	"github.com/google/uuid"
)

type User struct {
	IdUser        uuid.UUID `gorm:"primaryKey;type:uuid;default:uuid_generate_v4()"`
	EmailUser     string    `gorm:"type:varchar(255);unique;notNull"`
	PhoneUser     string    `gorm:"type:varchar(255);unique;notNull"`
	NameUser      string    `gorm:"type:varchar(255);notNull"`
	PasswordUser  string    `gorm:"type:varchar(255);notNull"`
	LatitudeUser  float32   `gorm:"type:float8;notNull"`
	LongitudeUser float32   `gorm:"type:float8;notNull"`
	CreatedAt     time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	UpdatedAt     time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
}
