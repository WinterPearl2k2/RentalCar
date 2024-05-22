package models

import (
	"time"

	"github.com/google/uuid"
)

type CetizenId struct {
	IdCetizen     uuid.UUID `gorm:"primaryKey;type:uuid;default:uuid_generate_v4()"`
	No            string    `gorm:"primaryKey;uniqueIndex;type:varchar(255)"`
	Fullname      string    `gorm:"type:varchar(255);notNull"`
	DateOfBirth   time.Time `gorm:"notNull"`
	Sex           string    `gorm:"type:varchar(255);notNull"`
	Nationality   string    `gorm:"type:varchar(255);notNull"`
	PlaceOfOrigin string    `gorm:"type:varchar(255);notNull"`
	UserId        uuid.UUID `gorm:"type:uuid;notNull;foreignKey:UserId"`

	User *User
}
