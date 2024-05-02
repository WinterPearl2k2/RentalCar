package models

import (
	"github.com/google/uuid"
)

type CarOwner struct {
	IdOwner uuid.UUID `gorm:"primaryKey;type:uuid;default:uuid_generate_v4()"`
	IdCar   uuid.UUID `gorm:"type:uuid"`
	IdUser  uuid.UUID `gorm:"type:uuid"`

	AddressOwner string `gorm:"type:string;notNull"`

	// Car  *Car  `gorm:"foreignKey:IdCar"`
	// User *User `gorm:"foreignKey:IdUser"`
}
