package models

import "github.com/google/uuid"

type RentHistory struct {
	StatusHistory int       `gorm:"type:uuid"`
	UserId        uuid.UUID `gorm:"type:uuid;notNull"`
	CarId         uuid.UUID `gorm:"type:uuid;notNull"`

	Car  *Car  `gorm:"foreignKey:CarId"`
	User *User `gorm:"foreignKey:UserId"`
}
