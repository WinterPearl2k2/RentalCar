package models

import (
	"time"

	"github.com/google/uuid"
)

type User struct {
	IdUser        uuid.UUID `gorm:"primaryKey;type:uuid;default:uuid_generate_v4()"`
	IdContract    uuid.UUID `gorm:"foreignKey:IdContract;type:uuid;unique;notNull"`
	EmailUser     string    `gorm:"type:varchar(255);uniqueIndex;notNull"`
	PhoneUser     string    `gorm:"type:varchar(255);uniqueIndex;notNull"`
	NameUser      string    `gorm:"type:varchar(255);notNull"`
	PasswordUser  string    `gorm:"type:varchar(255);notNull"`
	LatitudeUser  float32   `gorm:"type:float8;notNull"`
	LongitudeUser float32   `gorm:"type:float8;notNull"`
	CreatedAt     time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`
	UpdatedAt     time.Time `gorm:"notNull;default:CURRENT_TIMESTAMP"`

	Contract Contract `gorm:"foreignKey:IdContract"`
}
