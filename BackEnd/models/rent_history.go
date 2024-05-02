package models

import (
	"github.com/google/uuid"
)

type RentHistory struct {
	IdHistory     uuid.UUID `gorm:"primaryKey;type:uuid;default:uuid_generate_v4()"`
	StatusHistory int       `gorm:"type:uuid"`

	Car   *Car  `gorm:"foreignKey:IdCar"`
	Users *User `gorm:"foreignKey:IdUser"`
}
